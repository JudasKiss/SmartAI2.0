package smartView.ai.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import smartView.ai.project.model.ProjectVO;
import smartView.ai.project.model.ReportVO;
import smartView.ai.project.model.WorkflowVO;
import smartView.common.model.TuiGridVO;

public interface ProjectService {
    
    //히스토리
    public List<ReportVO> myHistory3(Map<String, Object> paramMap) throws Exception;
    
    //프로젝트
    public List<ProjectVO> selectProjectList(Map<String, Object> paramMap) throws Exception;
    public void insertProject(Map<String, Object> paramMap) throws Exception;   
    public void reviseProject(Map<String, Object> paramMap) throws Exception;  
    public void deleteProject(Map<String, Object> paramMap) throws Exception;  
    public int projectNameChk(String name) throws Exception; 
    public Map<String, Object> projectRead(Map<String, Object> paramMap) throws Exception;
    
    //태그
    public List<ProjectVO> selectTagList(Map<String, Object> paramMap) throws Exception;
    public List<ProjectVO> selectTop10(Map<String, Object> paramMap) throws Exception;
    
    //워크플로우
    public int[] totalStatus(Map<String, Object> paramMap);
    public List<WorkflowVO> selectWorkflowList(Map<String, Object> paramMap);
    public void insertWorkflow(Map<String, Object> paramMap) throws Exception;
    public void reviseWorkflow(Map<String, Object> paramMap) throws Exception;
    public void deleteWorkflow(Map<String, Object> paramMap) throws Exception;
    public void copyWorkflow(Map<String, Object> paramMap) throws Exception;
    public int workflowNameChk(String name) throws Exception;
    public Map<String, Object> workflowRead(Map<String, Object> paramMap) throws Exception;
    public List<String> projectWfList(Map<String, Object> paramMap) throws Exception;
    
    //레포트
    public List<WorkflowVO> selectReportList(Map<String, Object> paramMap);
    public void insertReport(Map<String, Object> paramMap) throws Exception;
    public void reviseReport(Map<String, Object> paramMap) throws Exception;
    public void deleteReport(Map<String, Object> paramMap) throws Exception;
    public void copyReport(Map<String, Object> paramMap) throws Exception;
    public int reportNameChk(String name) throws Exception;
    public Map<String, Object> reportRead(Map<String, Object> paramMap) throws Exception;
    public List<String> projectReportList(Map<String, Object> paramMap) throws Exception;
    
    /**
     * [워크플로우 리스트 불러오기]
     * @param paramMap
     * @return
     * @throws Exception
     */
    public Object slelectWorkflowList(Map<String, Object> paramMap) throws Exception;
    
    
    /**
     * workflow 공유 가능자 리스트 조회
     */
    public void selectWorkflowShareableUsers(WorkflowVO sWorkflowVO, TuiGridVO grid) throws Exception;
    
    /**
     * workflow 공유된 사용자 리스트 조회
     */
    public void selectWorkflowSharedUsers(WorkflowVO sWorkflowVO, TuiGridVO grid) throws Exception;
    
    /**
     * workflow 공유 
     */
    public String insertShareWorkflow(Map<String, Object> paramMap) throws Exception;
}
