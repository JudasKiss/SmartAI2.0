package smartView.ai.project.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import smartView.ai.project.model.ProjectVO;
import smartView.ai.project.model.WorkflowVO;
import smartView.ai.project.service.ProjectService;
import smartView.ai.workflow.web.WorkflowController;
import smartView.common.model.TuiGridVO;
import smartView.util.StringUtils;


@Controller
public class ProjectController {
    
    //로그
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectController.class);
    
    @Resource(name = "ProjectService")
    private ProjectService projectService;
    
    /** 
     * 팝업 띄우기
    **/
    //페이지 띄우기
    @RequestMapping(value = "/ai/project/projectList.do", method=RequestMethod.POST) 
    public String ViewPage(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        return "/ai/project/ProjectList";
    }
    //팝업 띄우기
    @RequestMapping(value = "/ai/project/Popup.do", method = RequestMethod.POST)
    public String Layer(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        return "/ai/project/Popup";
    }
    
    //팝업 오픈
    @RequestMapping(value = "/ai/project/PopupOpen.do", method = RequestMethod.POST)
    public String PopupOpen(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return StringUtils.nvl(paramMap.get("viewName"));
    }
    
    //Tag Search 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/SearchTags.do", method = RequestMethod.POST)
    public String SearchTags(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/SearchTags";
    }

    //Create New Project 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/CreateProject.do", method = RequestMethod.POST)
    public String CreateProject(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/CreateProject";
    }
    
    //DeleteProject 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/DeleteProject.do", method = RequestMethod.POST)
    public String DeleteProject(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/DeleteProject";
    }
    
    //DeleteWorkflow 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/DeleteWorkflow.do", method = RequestMethod.POST)
    public String DeleteWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/DeleteWorkflow";
    }
    
    //CreateFile 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/CreateFile.do", method = RequestMethod.POST)
    public String CreateFile(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("pid", StringUtils.nvl(paramMap.get("pid")));
        
        
        return "/ai/project/popup/CreateFile";
    }
    
    //CreateWorkflow 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/CreateWorkflow.do", method = RequestMethod.POST)
    public String CreateWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("pid", StringUtils.nvl(paramMap.get("pid")));
        return "/ai/project/popup/CreateWorkflow";
    }
    
    //CreateReport 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/CreateReport.do", method = RequestMethod.POST)
    public String CreateReport(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("pid", StringUtils.nvl(paramMap.get("pid")));
        
        return "/ai/project/popup/CreateReport";
    }
    
    //EditWorkflow 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/EditWorkflow.do", method = RequestMethod.POST)
    public String EditWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/EditWorkflow";
    }
    
    //EditProject 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/EditProject.do", method = RequestMethod.POST)
    public String EditProject(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/EditProject";
    }
    
    //CopyWorkflow 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/CopyWorkflow.do", method = RequestMethod.POST)
    public String CopyWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/CopyWorkflow";
    }
    
    //CopyReport 팝업 띄우기
    @RequestMapping(value = "/ai/project/popup/CopyReport.do", method = RequestMethod.POST)
    public String CopyReport(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("u_id", StringUtils.nvl(paramMap.get("u_id")));
        
        return "/ai/project/popup/CopyReport";
    }
    
    /** 
     * 팝업 띄우기 종료
    **/
    
    
    //레이어 호출
    @RequestMapping(value = "/ai/project/popup/layerOpen.do", method=RequestMethod.POST)
    public String layerOpen(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("name", StringUtils.nvl(paramMap.get("name")));  
        model.addAttribute("uuid", StringUtils.nvl(paramMap.get("uuid")));
        model.addAttribute("title", StringUtils.nvl(paramMap.get("title")));
        model.addAttribute("pid", StringUtils.nvl(paramMap.get("pid")));
        model.addAttribute("wid", StringUtils.nvl(paramMap.get("wid")));
        model.addAttribute("report_seq", StringUtils.nvl(paramMap.get("report_seq")));
        model.addAttribute("tags",StringUtils.nvl(paramMap.get("tags")));
        
        // 추가
        model.addAttribute("version", StringUtils.nvl(paramMap.get("version")));
        model.addAttribute("user_id", StringUtils.nvl(paramMap.get("user_id")));
        model.addAttribute("share_type", StringUtils.nvl(paramMap.get("share_type")));
        
        return StringUtils.nvl(paramMap.get("viewName"));
    }

    //프로젝트 리스트 나열
    @RequestMapping(value ="/ai/project/selectProjectList.do",  method=RequestMethod.POST)
    public String selectProjectList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
       model.addAttribute("result", projectService.selectProjectList(paramMap));
       model.addAttribute("result2",paramMap);
        return "comm/jsonView";
    }
    
    //워크플로우 리스트 나열
    @RequestMapping(value ="/ai/project/selectWorkflowList.do",  method=RequestMethod.POST)
    public String selectWorkflowList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
       model.addAttribute("result", projectService.selectWorkflowList(paramMap));
        return "comm/jsonView";
    }
    
    //리포트 리스트 나열
    @RequestMapping(value ="/ai/project/selectReportList.do",  method=RequestMethod.POST)
    public String selectReportList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
       model.addAttribute("result2", projectService.selectReportList(paramMap));
        return "comm/jsonView";
    }
    
    //프로젝트 상태 나타내기
    @RequestMapping(value ="/ai/project/totalStatus.do",  method=RequestMethod.POST)
    public String totalStatus(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
       model.addAttribute("result", projectService.totalStatus(paramMap));
        return "comm/jsonView";
    }
        
    //마이 히스토리
    @RequestMapping(value ="/ai/project/myHistory3.do",  method=RequestMethod.POST)
    public String myHistory3(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
       model.addAttribute("result", projectService.myHistory3(paramMap));
       if(paramMap.containsKey("uuid")) {
           model.addAttribute("uuid", paramMap.get("uuid"));
       } else {
           model.addAttribute("redirect", "Y");
       }
       if(paramMap.containsKey("projectId")) {
           model.addAttribute("projectId", paramMap.get("projectId"));
       }
        return "comm/jsonView";
    }
    
    //프로젝트 insert
    @RequestMapping(value = "/ai/project/insertProject.do", method=RequestMethod.POST)
    public String insertProject(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.insertProject(paramMap);  
        model.addAttribute("result", "1");
        return "comm/jsonView";         //: Ajax에 따른 ModelAndView 객체를 Json String 리턴
    }
    
    //프로젝트 생성시 태그 조회
    @RequestMapping(value = "/ai/project/selectTagList.do", method=RequestMethod.POST)
    public String selectTagList(@RequestParam Map<String,Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result",projectService.selectTagList(paramMap));
        model.addAttribute("result2",paramMap);
        return "comm/jsonView";
    }
    
    //태그 top 10 조회
    @RequestMapping(value = "/ai/project/selectTop10.do", method=RequestMethod.POST)
    public String selectTop10(@RequestParam Map<String,Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result",projectService.selectTop10(paramMap));
        return "comm/jsonView";
    }
    
    //프로젝트 revise
    @RequestMapping(value = "/ai/project/reviseProject.do", method=RequestMethod.POST)
    public String reviseProject(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.reviseProject(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //프로젝트 delete
    @RequestMapping(value = "/ai/project/deleteProject.do", method=RequestMethod.POST)
    public String deleteProject(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.deleteProject(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }

    //프로젝트 이름 중복체크
    @RequestMapping(value = "/ai/project/projectNameChk.do", method=RequestMethod.POST)
    public String projectNameChk(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
        int resultCnt = projectService.projectNameChk(StringUtils.nvl(paramMap.get("name")));
        model.addAttribute("result", String.valueOf(resultCnt));
        return "comm/jsonView";
    }
      
    //프로젝트 정보 팝업에 읽기
    @RequestMapping(value = "/ai/project/projectRead.do", method=RequestMethod.POST)
    public String projectRead(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result", projectService.projectRead(paramMap));
        return "comm/jsonView";
    }
    
    //워크플로우 insert
    @RequestMapping(value = "/ai/project/insertWorkflow.do", method=RequestMethod.POST)
    public String insertWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.insertWorkflow(paramMap);  
        model.addAttribute("pid",StringUtils.nvl(paramMap.get("pid")));
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }

    //워크플로우 revise
    @RequestMapping(value = "/ai/project/reviseWorkflow.do", method=RequestMethod.POST)
    public String reviseWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.reviseWorkflow(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //워크플로우 delete
    @RequestMapping(value = "/ai/project/deleteWorkflow.do", method=RequestMethod.POST)
    public String deleteWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.deleteWorkflow(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //워크플로우 copy
    @RequestMapping(value = "/ai/project/copyWorkflow.do", method=RequestMethod.POST)
    public String copyWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.copyWorkflow(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //워크플로우 이름 중복체크
    @RequestMapping(value = "/ai/project/workflowNameChk.do", method=RequestMethod.POST)
    public String workflowNameChk(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
        int resultCnt = projectService.workflowNameChk(StringUtils.nvl(paramMap.get("name")));
        model.addAttribute("result", String.valueOf(resultCnt));
        return "comm/jsonView";
    }
    
    //워크플로우 정보 팝업에 읽기
    @RequestMapping(value = "/ai/project/workflowRead.do", method=RequestMethod.POST)
    public String workflowRead(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result", projectService.workflowRead(paramMap));
        
        return "comm/jsonView";
    }
    
    //워크플로우 생성 시 프로젝트 wf 리스트 조회
    @RequestMapping(value = "/ai/project/projectWfList.do", method=RequestMethod.POST)
    public String projectWfList(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result", projectService.projectWfList(paramMap));
        
        return "comm/jsonView";
    }
    
    //워크플로우 생성 시 프로젝트report 리스트 조회
    @RequestMapping(value = "/ai/project/projectReportList.do", method=RequestMethod.POST)
    public String projectReportList(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result", projectService.projectReportList(paramMap));
        
        return "comm/jsonView";
    }

    //레포트 insert
    @RequestMapping(value = "/ai/project/insertReport.do", method=RequestMethod.POST)
    public String insertReport(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.insertReport(paramMap);  
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }

    //레포트 revise
    @RequestMapping(value = "/ai/project/reviseReport.do", method=RequestMethod.POST)
    public String reviseReport(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.reviseReport(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //레포트 delete
    @RequestMapping(value = "/ai/project/deleteReport.do", method=RequestMethod.POST)
    public String deleteReport(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.deleteReport(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //레포트 copy
    @RequestMapping(value = "/ai/project/copyReport.do", method=RequestMethod.POST)
    public String copyReport(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        projectService.copyReport(paramMap);
        model.addAttribute("result", "1");
        return "comm/jsonView";
    }
    
    //레포트 이름 중복체크
    @RequestMapping(value = "/ai/project/reportNameChk.do", method=RequestMethod.POST)
    public String reportNameChk(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
        int resultCnt = projectService.reportNameChk(StringUtils.nvl(paramMap.get("title")));
        model.addAttribute("result", String.valueOf(resultCnt));
        return "comm/jsonView";
    }
    
    //레포트 정보 팝업에 읽기
    @RequestMapping(value = "/ai/project/reportRead.do", method=RequestMethod.POST)
    public String reportRead(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
        model.addAttribute("result", projectService.reportRead(paramMap));
        return "comm/jsonView";
    }
    
    //projectId로 workflow 리스트 가져오기
    @RequestMapping(value = "/ai/project/slelectWorkflowList.do", method=RequestMethod.POST)
    public String slelectWorkflowList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
        model.addAttribute("result", projectService.slelectWorkflowList(paramMap));
        return "comm/jsonView";
    }
    
    
    /**
     * workflow 공유 가능자 리스트
     * @param
     * @return
     * @throws Exception
     * */
    @RequestMapping(value="/ai/project/selectWorkflowShareableUsers.do", method = RequestMethod.POST)
    public String selectWorkflowShareableUsers(@RequestBody WorkflowVO sWorkflowVO, TuiGridVO grid, ModelMap model, HttpServletRequest request) throws Exception {
        projectService.selectWorkflowShareableUsers(sWorkflowVO, grid);
        model.addAttribute("gridData", grid);
        return "grid/jsonView";
    }
    
    /**
     * workflow 공유된 사용자 리스트 조회
     * @param
     * @return
     * @throws Exception
     * */
    @RequestMapping(value="/ai/project/selectWorkflowSharedUsers.do", method = RequestMethod.POST)
    public String selectWorkflowSharedUsers(@RequestBody WorkflowVO sWorkflowVO, TuiGridVO grid, ModelMap model, HttpServletRequest request) throws Exception {
        projectService.selectWorkflowSharedUsers(sWorkflowVO, grid);
        model.addAttribute("gridData", grid);
        return "grid/jsonView";
    }
    
    
    /**
     * workflow 공유 데이터 저장
     * @param
     * @return
     * @throws Exception
     * */
    @RequestMapping(value="/ai/project/insertShareWorkflow.do", method = RequestMethod.POST)
    public String insertShareWorkflow(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        model.addAttribute("result", projectService.insertShareWorkflow(paramMap));
        return "comm/jsonView";
    }
}
