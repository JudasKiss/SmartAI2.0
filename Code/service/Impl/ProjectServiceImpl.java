package smartView.ai.project.service.Impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import smartView.ai.common.api.service.ApiService;
import smartView.ai.common.convert.service.ConvertService;
import smartView.ai.common.date.DateService;
import smartView.ai.common.hdfs.service.HdfsService;
import smartView.ai.project.model.ProjectVO;
import smartView.ai.project.model.ReportVO;
import smartView.ai.project.model.WorkflowVO;
import smartView.ai.project.service.ProjectService;
import smartView.common.dao.CommonDAO;
import smartView.common.dao.OkDAO;
import smartView.common.dao.UiDAO;
import smartView.common.model.TuiGridVO;
import smartView.system.exception.BusinessException;
import smartView.system.session.UserSession;
import smartView.util.StringUtils;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService{
    
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectServiceImpl.class);
    
    @Resource
    private UserSession userSession;
    
    @Resource(name="commonDAO")
    private CommonDAO dao;
    
    @Resource(name = "uiDAO")
    private UiDAO uiDao;
    
    @Resource(name="okDAO")
    private OkDAO okDao;
    
    @Resource
    private ConvertService convertService;
    
    @Resource
    private HdfsService hdfsService;
    
    @Resource
    private ApiService apiService;
    
    @Resource
    private DateService dateService;

    //프로젝트 조회
    public List<ProjectVO> selectProjectList(Map<String, Object> paramMap){
        
        paramMap.put("user_id", userSession.getUserId());
        
        List<ProjectVO> pArr = uiDao.selectList("Project.selectProjectInfo", paramMap);
        List<ProjectVO> tArr = uiDao.selectList("Project.selectTags", paramMap);
        
        //태그 추가
        for(int i=0;i<pArr.size();i++) {
            for(int j=0;j<tArr.size();j++) {
                if(pArr.get(i).getUuid().equals(tArr.get(j).getUuid())) {
                    pArr.get(i).setTags(tArr.get(j).getTags());
                }
            }
        } 
        return pArr;
    }   
    
    
    //프로젝트 카드 내 워크플로우 클릭시 조회
    public List<WorkflowVO> selectWorkflowList(Map<String, Object> paramMap){
        paramMap.put("user_id", userSession.getUserId());
        List<WorkflowVO> wArr = uiDao.selectList("Project.selectWorkflowInfo", paramMap);
        //워크플로우-워크플로우Job 연결
        List<WorkflowVO> wfJob = uiDao.selectList("Project.getWfJobID", paramMap);
        Map<String, WorkflowVO> wfJobMappingMap = new HashMap<String, WorkflowVO>();
        List<String> jobIdList = new ArrayList<>(); //jobID만 가져올 리스트 선언
        if(wfJob.size()!=0) {
            for(int i=0;i<wfJob.size();i++) { //wfJob에서 jobId만 가져옴
                jobIdList.add(wfJob.get(i).getJobID());
                for(WorkflowVO workflowVo : wArr) {
                    if(workflowVo.getUuid().equals(wfJob.get(i).getWorkflowID())) {
                        wfJobMappingMap.put(wfJob.get(i).getJobID(), workflowVo);
                    }
                } 
            }
        }
        if(jobIdList.isEmpty()) {
            jobIdList.add("");
        }
        List<WorkflowVO> wfStatus = okDao.selectList("Project.getWfStatus", jobIdList); // 워크플로우의 상태를 나타내는 쿼리 중 jobId가 있는 것만 리스트로 가져옴     
        for(WorkflowVO jstatus : wfStatus) {
            if(wfJobMappingMap.containsKey(jstatus.getWfJobID())) {
                String status = "";
                
                if(jstatus.getIs_active()) {
                    status = "progressing";
                } else if (jstatus.getResult().contains("failure")) {
                    status = "failed";
                } else if (jstatus.getResult().contains("unknown")) {
                    status = "";
                } else {
                    status = "completed";
                } 
                wfJobMappingMap.get(jstatus.getWfJobID()).setStatus(status);
            }
        }
        return wArr;
    }
    
    
    //워크플로우 상태 나타내기
    public int[] totalStatus(Map<String, Object> paramMap){
        int[] arr = new int[3];
        paramMap.put("user_id", userSession.getUserId());
        int all = uiDao.selectOne("Project.totalAll",paramMap);
        List<String> totalJobId = uiDao.selectList("Project.totalJobId",paramMap);
        if(totalJobId.isEmpty()) {
            totalJobId.add("");
        }
        //상태 추가
        if(totalJobId.isEmpty()) {
            totalJobId.add("");
        }
        List<WorkflowVO> totalStatus = okDao.selectList("Project.totalStatus", totalJobId);
        int progressing = 0;
        int failed =0;
        int nothing =0;
        int successed =0;
        for(int i=0;i<totalStatus.size();i++) {
                if(totalStatus.get(i).getIs_active()) {
                    progressing++;
                } else if (totalStatus.get(i).getResult().contains("failure")) {
                    failed++;
                } else if (totalStatus.get(i).getResult().contains("unknown")) {
                    nothing++;
                } else {
                    successed++;
                }
        }
        arr[0] = all;
        arr[1] = successed;
        arr[2] = failed;
        return arr;
    }
    
    
    //프로젝트 카드 내 리포트 클릭시 조회
    public List<WorkflowVO> selectReportList(Map<String, Object> paramMap){
        paramMap.put("user_id", userSession.getUserId());
        List<WorkflowVO> rArr = uiDao.selectList("Project.selectReportInfo", paramMap);

        return rArr;
    }
    
    

    
    //My History 3개 조회
    public List<ReportVO> myHistory3(Map<String, Object> paramMap) throws Exception {
        paramMap.put("user_id", userSession.getUserId());
        List<ReportVO> history = uiDao.selectList("Project.myHistory3", paramMap);
        return history;
    }
    
    //프로젝트 insert
    public void insertProject(Map<String, Object> paramMap) throws Exception{
            paramMap.put("user_id", userSession.getUserId());
            paramMap.put("timestamp",System.currentTimeMillis());
            String uuid = UUID.randomUUID().toString();
            paramMap.put("uuid",uuid);
            
            String tags = paramMap.get("tags").toString();
            if(tags!="") {
                tags.substring(tags.length()-1);
                String[] arr = tags.split(",");
                for(int i=0;i<arr.length;i++) {
                    paramMap.put("tag",arr[i]);
                    paramMap.put("pid",uuid);
    
                    uiDao.insert("Project.insertTags", paramMap);
                    
                    if(paramMap.containsKey("tag_seq")) { //기존 태그면 태그시퀀스 반환 x, 새로운 태그면 태그시퀀스 반환
                        uiDao.insert("Project.insertTagsMap", paramMap);
                    }else {
                        int tagCnt = uiDao.selectOne("Project.selectTagCnt", paramMap);
                        tagCnt++;
                        paramMap.put("use_count",tagCnt);
                        uiDao.update("Project.reviseTag", paramMap);
                        int tagseq = uiDao.selectOne("Project.getTagSeq", paramMap);
                        paramMap.put("tag_seq",tagseq);
                        uiDao.insert("Project.insertTagsMap", paramMap);
                        paramMap.remove("tag_seq");
                    }
                }
            }
            uiDao.insert("Project.insertProject", paramMap);
    }
    
    //프로젝트 생성 시 태그 조회
    public List<ProjectVO> selectTagList(Map<String, Object> paramMap) throws Exception{
        paramMap.put("user_id", userSession.getUserId());
        List<ProjectVO> tagList = uiDao.selectList("Project.selectTagList", paramMap);
       
        return tagList;
    }
    
    //태그 TOP 10 조회
    public List<ProjectVO> selectTop10(Map<String, Object> paramMap) throws Exception{
        List<ProjectVO> top10 = uiDao.selectList("Project.selectTop10", paramMap);
        return top10;
    }

    //프로젝트 revise
    public void reviseProject(Map<String, Object> paramMap) throws Exception{
        try {
            paramMap.put("timestamp",System.currentTimeMillis());
            paramMap.put("pid",paramMap.get("uuid").toString());
            String originTags = paramMap.get("originTags").toString(); //김윤지#변윤수#한보현
            String[] tArr =originTags.split("#");
            for(int i=0;i<tArr.length;i++) {
                paramMap.put("tag_r",tArr[i]);
                uiDao.delete("Project.deleteTags_R", paramMap);
            }

            String tags = paramMap.get("tags").toString();
            tags.substring(tags.length()-1);
            String[] arr = tags.split(",");
            
            for(int i=0;i<arr.length;i++) {
                paramMap.put("tag",arr[i]);
                
                uiDao.insert("Project.insertTags", paramMap);
                
                if(paramMap.containsKey("tag_seq")) {
                    uiDao.insert("Project.insertTagsMap", paramMap);
                }else {
                    int tagCnt = uiDao.selectOne("Project.selectTagCnt", paramMap);
                    tagCnt++;
                    paramMap.put("use_count",tagCnt);
                    uiDao.update("Project.reviseTag", paramMap);                   
                    int tagseq = uiDao.selectOne("Project.getTagSeq", paramMap);
                    paramMap.put("tag_seq",tagseq);
                    uiDao.insert("Project.insertTagsMap", paramMap);
                    paramMap.remove("tag_seq");
                }
            }
            uiDao.update("Project.reviseProject", paramMap);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    
    //프로젝트 delete
    public void deleteProject(Map<String, Object> paramMap) throws Exception{
        try {
            uiDao.delete("Project.deleteProject", paramMap);
            uiDao.delete("Project.deleteTagMap", paramMap);
            uiDao.delete("Project.deleteWorkflow_p", paramMap);
            uiDao.delete("Project.deleteReport_p", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //프로젝트 이름 중복 체크
    public int projectNameChk(String name) throws Exception {
        return (int) uiDao.selectOne("Project.projectNameChk", name);
    } 
    
    //프로젝트 데이터 상세 보기
    public Map<String, Object> projectRead(Map<String, Object> paramMap) throws Exception {
        Map<String, Object> ProjectInfos = new HashMap<String, Object>();
        try {
            ProjectInfos.put("ProjectInfos", uiDao.selectOne("Project.selectProject", paramMap.get("uuid").toString()));
         }catch (Exception e) {
             throw new BusinessException("fail.common.update");
         }
         return ProjectInfos;
     }
    
    //워크플로우 insert
    public void insertWorkflow(Map<String, Object> paramMap) throws Exception{
        try {
            paramMap.put("user_id", userSession.getUserId());
            paramMap.put("timestamp",System.currentTimeMillis());
            paramMap.put("uuid",UUID.randomUUID().toString());
            uiDao.insert("Project.insertWorkflow", paramMap);
            uiDao.insert("Project.insertWorkflowMap", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    
    //워크플로우 revise
    public void reviseWorkflow(Map<String, Object> paramMap) throws Exception{
        try {
            paramMap.put("timestamp",System.currentTimeMillis());
            uiDao.update("Project.reviseWorkflow", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //워크플로우 delete
    public void deleteWorkflow(Map<String, Object> paramMap) throws Exception{
        try {
            uiDao.delete("Project.deleteWorkflow", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //워크플로우 copy
    public void copyWorkflow(Map<String, Object> paramMap) throws Exception{
        try {
            paramMap.put("user_id", userSession.getUserId());
            paramMap.put("timestamp",System.currentTimeMillis());
            paramMap.put("uuid",UUID.randomUUID().toString());
            if(paramMap.get("wid")==null) {
                String wid = uiDao.selectOne("Project.findWfName",paramMap);
               paramMap.put("wid",wid);
            }
            uiDao.insert("Project.copyWorkflow", paramMap);
            uiDao.insert("Project.insertWorkflowMap", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    //워크플로우 이름 중복 체크
    public int workflowNameChk(String name) throws Exception {
        return (int) uiDao.selectOne("Project.workflowNameChk", name);
    } 
    
    //워크플로우 데이터 상세 보기
    public Map<String, Object> workflowRead(Map<String, Object> paramMap) throws Exception {
        Map<String, Object> WorkflowInfos = new HashMap<String, Object>();
        try {
            paramMap.put("user_id",userSession.getUserId());
            WorkflowInfos.put("WorkflowInfos", uiDao.selectOne("Project.selectWorkflow", paramMap));
            WorkflowInfos.put("result", uiDao.selectList("Project.selectProjectName", paramMap));
         }catch (Exception e) {
             throw new BusinessException("fail.common.update");
         }
         return WorkflowInfos;
     }
    
    
    //프로젝트 생성 시 워크플로우 조회
    public List<String> projectWfList(Map<String, Object> paramMap) throws Exception{
        paramMap.put("user_id", userSession.getUserId());
        List<String> projectWfList = uiDao.selectList("Project.projectWfList", paramMap);
       
        return projectWfList;
    }
    
    //프로젝트 생성 시 리포트 조회
    public List<String> projectReportList(Map<String, Object> paramMap) throws Exception{
        paramMap.put("user_id", userSession.getUserId());
        List<String> projectReportList = uiDao.selectList("Project.projectReportList", paramMap);
       
        return projectReportList;
    }
    
    //레포트 insert
    public void insertReport(Map<String, Object> paramMap) throws Exception{
        try {
            paramMap.put("user_id", userSession.getUserId());
            paramMap.put("reg_seq", Integer.parseInt(userSession.getUserSeq()));
            paramMap.put("uuid", UUID.randomUUID().toString());
            SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");       
            String red_dt = format1.format (System.currentTimeMillis());
            paramMap.put("reg_dt",red_dt);
            uiDao.insert("Project.insertReport", paramMap);
            uiDao.insert("Project.insertReportMap", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    
    //레포트 revise
    public void reviseReport(Map<String, Object> paramMap) throws Exception{
        try {
            uiDao.update("Project.reviseReport", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //레포트 delete
    public void deleteReport(Map<String, Object> paramMap) throws Exception{
        try {
            uiDao.delete("Project.deleteReport", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //레포트 copy
    public void copyReport(Map<String, Object> paramMap) throws Exception{
        try {
            paramMap.put("user_id", userSession.getUserId());
            paramMap.put("uuid", UUID.randomUUID().toString());
            paramMap.put("reg_seq", Integer.parseInt(userSession.getUserSeq()));
            SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");       
            String red_dt = format1.format (System.currentTimeMillis());
            paramMap.put("reg_dt",red_dt);
            if(paramMap.get("report_seq")==null) {
                String report_seq = uiDao.selectOne("Project.findReportTitle",paramMap);
               paramMap.put("report_seq",report_seq);
            }
            uiDao.insert("Project.copyReport", paramMap);
            uiDao.insert("Project.insertReportMap", paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //레포트 이름 중복 체크
    public int reportNameChk(String name) throws Exception {
        return (int) uiDao.selectOne("Project.reportNameChk", name);
    } 
    
    //레포트 데이터 상세 보기
    public Map<String, Object> reportRead(Map<String, Object> paramMap) throws Exception {
        Map<String, Object> ReportInfos = new HashMap<String, Object>();
        try {
            paramMap.put("user_id",userSession.getUserId());
            ReportInfos.put("result", uiDao.selectList("Project.selectProjectName", paramMap));
            ReportInfos.put("ReportInfos", uiDao.selectOne("Project.selectReport", paramMap));
             
         }catch (Exception e) {
             throw new BusinessException("fail.common.update");
         }
         return ReportInfos;
    }
    
    //projectId로 workflow List 조회
    @Override
    public Object slelectWorkflowList(Map<String, Object> paramMap) throws Exception {
        List<WorkflowVO> workflowList = uiDao.selectList("Project.slelectWorkflowList", paramMap);
        return workflowList ;
    }
    
    
    
    
    /**
     * workflow 공유 가능자 리스트 조회
     * @param user_id - user 아이디
     * @param wid - workflow 아이디
     */
    @Override
    public void selectWorkflowShareableUsers(WorkflowVO sWorkflowVO, TuiGridVO grid) throws Exception {
        try {
            List<WorkflowVO> result = uiDao.selectList("Project.selectWorkflowShareableUsers", sWorkflowVO);
            grid.setContents(result);
            grid.setTotalCount(result.size());
        } catch(Exception e) {
            grid.setResult(false);
        }
    }
    
    /**
     * workflow 공유된 사용자 리스트 조회
     * @param user_id - user 아이디
     * @param wid - workflow 아이디
     */
    @Override
    public void selectWorkflowSharedUsers(WorkflowVO sWorkflowVO, TuiGridVO grid) throws Exception {
        try {
            List<WorkflowVO> result = uiDao.selectList("Project.selectWorkflowSharedUsers", sWorkflowVO);
            grid.setContents(result);
            grid.setTotalCount(result.size());
        } catch(Exception e) {
            grid.setResult(false);
        }
    }
    
    
    /**
     * workflow 공유 데이터 생성
     *   - 각 사용자들에게 공유 하기 전 공유 전용 데이터를 생성 하고 reader 영역에서 사용되는 파일들 또한 공유 시점 기준으로 복사를 한다.
     *   - 복사된 파일들은 만료일이 있음. 해당 파일들은 spring quartz를 통해 관리될 예정
     * @param
     * @return
     * @throws Exception
     * */
    public String insertShareWorkflow(Map<String, Object> paramMap) {
        try {
            paramMap.put("user_id", userSession.getUserId());
            paramMap.put("user_seq", Integer.parseInt(userSession.getUserSeq()));
            paramMap.put("wid", StringUtils.nvl(paramMap.get("wid")));
            paramMap.put("version", StringUtils.nvl(paramMap.get("version")));
            
            
            // 기존에 공유한 것이 있는지 조회 
            int share_check = uiDao.selectOne("Project.selectCheckWorkflowShare", paramMap);
            
            // 공유하려는 워크플로우 정보 조회
            Map<String, Object> workflow_info = uiDao.selectOne("Project.selectOwnerWorkflowInfo", paramMap);
            
            /* 이전에 이미 공유한 적 있음 */
            if(share_check > 0) {
                LOGGER.debug("정상 작동 확인. 업데이트 예정.");
            /* 이전에 공유한 적 없음 신규 저장 */
            } else {
                
                // shared_seq를 생성하기 위한 선제 저장
                paramMap.put("name", workflow_info.get("name"));
                paramMap.put("data", "");
                paramMap.put("descr", workflow_info.get("descr"));
                paramMap.put("msg_version", workflow_info.get("msg_version"));
                paramMap.put("is_batch", (int)workflow_info.get("is_batch"));
                paramMap.put("verbose", (int)workflow_info.get("verbose"));
                paramMap.put("expire_dt", dateService.getExpiryDateTime("share.workflow.copyfile.validity"));   // 공유 만료일 계산 (계산 시점 부터 명시된 기간 만큼)
                
                // tb_shared_workflow_info 테이블에 공유 정보 저장
                uiDao.insert("Project.insertWorkflowShare", paramMap);
                
                // 해당 워크플로우에 있는 data 필드의 JSON 데이터를 parsing
                JsonObject eng_obj = new Gson().fromJson(workflow_info.get("data").toString(), JsonObject.class).get("enginesJson").getAsJsonObject();
                
                // 복사할 file path 리스트 수집
                HashMap<String, String> path_map = new HashMap<String, String>();
                
                // path 집계
                findShareTargetFile(eng_obj, path_map);
                
                // 집계 결과 
                Iterator<Entry<String, String>> path_iter = path_map.entrySet().iterator();
                String modifi_data = workflow_info.get("data").toString();
                
                // 집계 결과 수정 및 파일 생성
                while(path_iter.hasNext()) {
                    Map.Entry<String, String> entry = path_iter.next();
                    
                    String origin_path = entry.getKey();    // 원본 path
                    String modifi_path = entry.getValue();  // 수정된 path
                    
                    // 원본 파일이 동일한 패스에 존재하는지 확인
                    if(hdfsService.isExist(origin_path)) {
                        // 파일 복제 후 결과 반환
                        boolean copy_status = hdfsService.copy(origin_path, modifi_path);
                        
                        // 복제가 정상처리 되었을 경우 json 데이터 변경
                        if(copy_status) {
                            // 원본 json 데이터에서 file path 수정
                            modifi_data = modifi_data.replaceAll(convertService.replaceKeyConvertSpecialChar(origin_path), modifi_path);
                            
                            // 공유 파일 정보 등록 
                            paramMap.put("shared_seq", Integer.parseInt(StringUtils.nvl(paramMap.get("shared_seq"))));
                            paramMap.put("org_file_path", entry.getKey());
                            paramMap.put("file_path", entry.getValue());
                            
                            uiDao.insert("Project.insertShareFileInfo", paramMap);
                        } else {
                            break;
                        }
                    }
                }
                
                // 최종 data json 업데이트, 공유자 정보 맵핑 저장
                paramMap.put("data", modifi_data);
                uiDao.update("Project.updateWorkflowShareData", paramMap);
                
                JsonArray share_user_list = new JsonParser().parse(paramMap.get("json").toString()).getAsJsonArray();
                
                for(JsonElement user_el : share_user_list) {
                    paramMap.put("shared_target_seq", paramMap.get("shared_seq"));
                    paramMap.put("shared_target_id", user_el.getAsJsonObject().get("id").getAsString());
                    paramMap.put("shared_target_type", "U");
                    
                    uiDao.insert("Project.insertWorkflowShareUsers", paramMap);
                }
                
            } ///* 이전에 공유한 적 없음 신규 저장 종료 */
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return "success";
    }
    
    
    /**
     * 워크플로우 path 데이터 집계
     * - JsonObject에서 파일 path를 전부 집계 하여 맵에 반환
     * @param obj - 집계할 데이터 원본
     * @param path_map - 집계 결과 
     * */
    public void findShareTargetFile(JsonObject obj, Map<String, String> path_map) {
        
        try {
            //
            Set<String> key_list = obj.keySet();
            
            Iterator<String> key_iter = key_list.iterator(); 
            
            while(key_iter.hasNext()) {
                String key = key_iter.next();
                
                // ui type 키가 있는지 확인 -> 있으면 체크, 없으면 다시 function 실행
                if(key.equals("__componentFieldUIType")) {
                    if(obj.get(key).getAsString().equals("pathTypeInputBox")) {
                        // path가 여러개 등록될 수 있는 array 구조인 경우 
                        if(obj.get("value").isJsonArray()) {
                            JsonArray path_value_list = obj.get("value").getAsJsonArray();
                            String[] path_list = new Gson().fromJson(path_value_list, String[].class);
                            
                            // 파일을 여러개 등록한 경우
                            for(String path_str : path_list) {
                                path_map.put(path_str.replaceAll("\"", ""), ("temp/" + path_str.replaceAll("\"", "")));
                            }
                        } else {
                            String origin_str = obj.get("value").toString().replaceAll("\"", "");
                            path_map.put(origin_str, ("temp/" + origin_str));
                        }
                    }
                // 원하는 키가 아니어서 내부조회를 해야함.
                } else {
                    // 내부 조회전 JsonObject 형태인지 확인해야함.
                    if(obj.get(key).isJsonObject()) {
                        // JsonObject 형태면 다시 재귀 조회
                        findShareTargetFile(obj.get(key).getAsJsonObject(), path_map);
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    //JsonElement je = jp.parse(paramMap.get("json").toString());
    //JsonArray arr = je.getAsJsonArray();
    
    //for(JsonElement el : arr) {
    //    JsonObject obj = el.getAsJsonObject();
        //Map<String, Object> component_info = new HashMap<String, Object>(); 
        //component_info.put("type", type_fr + type_str.substring(1));
        //component_info.put("version", paramMap.get("version"));
        //uiDao.insert("Project.insertEngineTemplateMap", component_info);
    //}
}
    

