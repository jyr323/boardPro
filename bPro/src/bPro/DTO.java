
package bPro;

public class DTO {
	private int num;
	private String name;
	private String title;
	private String password;
	private String content;
	private int hitCount;
	private String date;
	private String newdate;
	private int available;
	
	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public DTO(){
		
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getNewdate() {
		return newdate;
	}

	public void setNewdate(String newdate) {
		this.newdate = newdate;
	}

	public DTO(int num, String name, String title, String password, String content, int hitCount, String date, String newdate){
		this.num= num;
		this.name = name;
		this.title= title;
		this.password = password;
		this.content = content;
		this.hitCount = hitCount;
		this.date = date ;
		this.newdate = newdate;
	}
}
