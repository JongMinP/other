package org.mycom.domain;

import java.sql.Date;

public class BoardVO {
	//카테고리 이름(사용안함)
	String catename;
	//카테고리 번호
	Integer	cateidx; 
	//부모 카테고리 번호(등록시에 부모카테리도 입력해줘야 나중에 게시판별 상위n개를 뽑아낼때 수월하다.)
	Integer parentidx;
	//게시물 번호
	Integer	bno;
	//사용자 아이디
	String userid;
	//사용자 닉네임
	String	writer; 
	//글 제목
	String	title;
	//글 내용
	String content;
	//조회수
	Integer viewcnt;
	//입력날짜
	Date regdate;
	//리플 수량(리스트에서 표시하고, 읽기페이지 하단에 표시)
	Integer replycnt;
	//공지사항 인지 확인
	String notice;
	//첨부파일(클라이언트 측에서 받아오는 파일들)
	String[] file_url;
	//파일의 full url 주소값(DB에 삽입하기 위함)
	String fileName;
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public Integer getCateidx() {
		return cateidx;
	}
	public void setCateidx(Integer cateidx) {
		this.cateidx = cateidx;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(Integer replycnt) {
		this.replycnt = replycnt;
	}
	public Integer getParentidx() {
		return parentidx;
	}
	public void setParentidx(Integer parentidx) {
		this.parentidx = parentidx;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String[] getFile_url() {
		return file_url;
	}
	public void setFile_url(String[] file_url) {
		this.file_url = file_url;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "BoardVO [getCateidx()=" + getCateidx() + ", getBno()="
				+ getBno() + ", getWriter()=" + getWriter() + ", getTitle()="
				+ getTitle() + ", getContent()=" + getContent()
				+ ", getViewcnt()=" + getViewcnt() + ", getRegdate()="
				+ getRegdate() + "]";
	}
}
