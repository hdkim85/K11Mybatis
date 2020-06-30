package mybatis;

public class MyBoardDTO {
	
	//멤버변수
    private int idx;
    private String id;
    private String name;
    private String contents;
    
    //기본생성자 만들필요 없음
    //getter/setter
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
    
    

	
	
	
}
