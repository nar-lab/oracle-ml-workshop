CREATE OR REPLACE DIRECTORY ZIRAAT_DM_DIR AS '/home/oracle/Desktop/ziraat_teknoloji_workshop/00_wf_dbdir';

DECLARE
	v_wfId NUMBER := NULL;
	v_projectId NUMBER := NULL;
	v_obj_cnt NUMBER := 0;
  
  v_jobId VARCHAR2(30) := NULL;
	v_status VARCHAR2(30) := NULL;
	v_projectName VARCHAR2(30) := 'Retail_Analytics';
	v_workflow_name VARCHAR2(30);
	v_node VARCHAR2(30);
	v_run_mode VARCHAR2(30) := ODMRSYS.ODMR_WORKFLOW.RERUN_NODE_CHILDREN;
	v_failure NUMBER := 0;
	v_nodes ODMRSYS.ODMR_OBJECT_NAMES := ODMRSYS.ODMR_OBJECT_NAMES();
BEGIN

	SELECT COUNT(1) INTO v_obj_cnt FROM ODMR_USER_PROJECT_WORKFLOW
			WHERE PROJECT_NAME = v_projectName;

	IF v_obj_cnt > 0 THEN
		BEGIN
      
      v_workflow_name := '01_DataExplore';
     	SELECT COUNT(1) INTO v_obj_cnt FROM ODMR_USER_PROJECT_WORKFLOW
    			WHERE PROJECT_NAME = v_projectName AND WORKFLOW_NAME = v_workflow_name;

    	IF v_obj_cnt > 0 THEN
    		BEGIN
          SELECT WORKFLOW_ID INTO v_wfId FROM ODMR_USER_PROJECT_WORKFLOW
    			WHERE PROJECT_NAME = v_projectName AND WORKFLOW_NAME = v_workflow_name;
          ODMRSYS.ODMR_WORKFLOW.WF_DELETE(p_workflowId => v_wfId);
          DBMS_OUTPUT.PUT_LINE(v_wfId);
       END;
      END IF;
      
      SELECT DISTINCT PROJECT_ID INTO v_projectId FROM ODMR_USER_PROJECT_WORKFLOW
			WHERE PROJECT_NAME = v_projectName;
      ODMRSYS.ODMR_PROJECT.PROJECT_DELETE(p_project_id => v_projectId);
      DBMS_OUTPUT.PUT_LINE(v_projectId);
      
    END;
	END IF;
  
 
  v_projectId := ODMRSYS.ODMR_PROJECT.PROJECT_CREATE(p_project_name => v_projectName, p_comment => 'Retail DB Analytics Solution');
  DBMS_OUTPUT.PUT_LINE('Project: '||v_projectId);
  
  v_workflow_name := '01_DataExplore';
	v_wfId := ODMRSYS.ODMR_WORKFLOW.WF_IMPORT(
                        p_project_id => v_projectId,
											  p_workflow_name => v_workflow_name,
											  p_workflow_data => XMLType(bfilename('ZIRAAT_DM_DIR', 'Retail_01_DataExplore.xml'), nls_charset_id('AL32UTF8')),
											  p_comment => 'Retail Customer Data Mart Preperation');
	DBMS_OUTPUT.PUT_LINE('Workflow: '||v_wfId);										  
	
  v_node := 'RETAIL_DM';
  v_workflow_name := '01_DataExplore';
  v_nodes.extend();
	v_nodes(v_nodes.count) := v_node;
	v_jobId := ODMRSYS.ODMR_WORKFLOW.WF_RUN(
                      p_project_name => v_projectName,
											p_workflow_name => v_workflow_name,
											p_node_names => v_nodes,
											p_run_mode => v_run_mode,
											p_start_date => NULL,
											p_repeat_interval => NULL,
											p_end_date => NULL);
	DBMS_OUTPUT.PUT_LINE('Job: '||v_jobId);
	-- wait for workflow to run to completion
	LOOP
		SELECT STATUS INTO v_status FROM ODMR_USER_PROJECT_WORKFLOW
		WHERE WORKFLOW_NAME = v_workflow_name;
		
		IF (v_status IN ('SCHEDULED', 'ACTIVE')) THEN
			DBMS_LOCK.SLEEP(10); -- wait for 10 secs
		ELSE
			EXIT; -- workflow run completes
		END IF;
	END LOOP;
  
	
END;
/
