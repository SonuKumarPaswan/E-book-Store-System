package com.sp.Ebook_App.entity;

public class BookOrder {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String fullAdd;
	private String phone;
	private String landmark;
	private String city;
	private String state;
	private String pincode;
	private String bookName;
	private String author;
	private double price;
	private String paymentType;
	
	public BookOrder() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullAdd() {
		return fullAdd;
	}

	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", fullAdd=" + fullAdd + ", phone=" + phone + ", landmark=" + landmark + ", city=" + city + ", state="
				+ state + ", pincode=" + pincode + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", paymentType=" + paymentType + "]";
	}


	
}
