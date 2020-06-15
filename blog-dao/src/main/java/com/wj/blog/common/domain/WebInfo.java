package com.wj.blog.common.domain;

import com.wj.blog.common.utils.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class WebInfo {
    private Integer blogTotal;
    private Integer leaveMessageTotal;
    private Integer CategoryTotal;
    private Integer noteTotal;
    private Integer linkTotal;
    //服务器运行天数
    private Long serverRunTime;
    //网站浏览总数
    private Long browseTotal;
    //最后更新时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastUpdateTime;
    private String lastUpdateTimeText;

    public Integer getBlogTotal() {
        return blogTotal;
    }

    public void setBlogTotal(Integer blogTotal) {
        this.blogTotal = blogTotal;
    }

    public Integer getLeaveMessageTotal() {
        return leaveMessageTotal;
    }

    public void setLeaveMessageTotal(Integer leaveMessageTotal) {
        this.leaveMessageTotal = leaveMessageTotal;
    }

    public Integer getCategoryTotal() {
        return CategoryTotal;
    }

    public void setCategoryTotal(Integer categoryTotal) {
        CategoryTotal = categoryTotal;
    }

    public Integer getNoteTotal() {
        return noteTotal;
    }

    public void setNoteTotal(Integer noteTotal) {
        this.noteTotal = noteTotal;
    }

    public Integer getLinkTotal() {
        return linkTotal;
    }

    public void setLinkTotal(Integer linkTotal) {
        this.linkTotal = linkTotal;
    }

    public Long getServerRunTime() {
        return serverRunTime;
    }

    public void setServerRunTime(Long serverRunTime) {
        this.serverRunTime = serverRunTime;
    }

    public Long getBrowseTotal() {
        return browseTotal;
    }

    public void setBrowseTotal(Long browseTotal) {
        this.browseTotal = browseTotal;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public String getLastUpdateTimeText() {
        if(lastUpdateTime==null){
            return "";
        }
        return DateUtil.parseDateToStr(lastUpdateTime,DateUtil.DATE_FORMAT_YYYY_MM_DD);
    }



    @Override
    public String toString() {
        return "WebInfo{" +
                "blogTotal=" + blogTotal +
                ", leaveMessageTotal=" + leaveMessageTotal +
                ", CategoryTotal=" + CategoryTotal +
                ", noteTotal=" + noteTotal +
                ", linkTotal=" + linkTotal +
                ", serverRunTime=" + serverRunTime +
                ", browseTotal=" + browseTotal +
                ", lastUpdateTime=" + lastUpdateTime +
                ", lastUpdateTimeText='" + lastUpdateTimeText + '\'' +
                '}';
    }
}
