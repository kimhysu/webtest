package team;

public class TeamDTO {
	private int teamno;
	private String name;
	private String phone;
	private String gender;
	private String[] skill;
	private String skillstr;
	private String hobby;
	private String zipcode;
	private String address1;
	private String address2;

	public int getTeamno() {
		return teamno;
	}

	public void setTeamno(int teamno) {
		this.teamno = teamno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getSkill() {
		return skill;
	}

	// 폼에서 선택된 보유기술을 저장한다.
	public void setSkill(String[] skill) {
		this.skill = skill;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	// 1.디비에서 저장하거나 수정할때 2.db에 데이터를 읽어와서 web페이지에 출력할 때
	public String getSkillstr() {
		if (skill != null) {
			String skillstr = "";
			for (int i = 0; i < skill.length; i++) {
				skillstr+=skill[i];
					if (i < skill.length - 1) {
						skillstr += ",";
					}
				}
				this.skillstr = skillstr;
			}
		return skillstr;
	}

	// db에서 레콛값을 가져올때 호출
	public void setSkillstr(String skillstr) {
		this.skillstr = skillstr;
	}

}
