package team.swcome.donong.dto;

import java.util.Date;

import javax.annotation.Resource;

@Resource
public class BoardDTO {
int com_num;
String com_id;
String com_pass;
String com_name;
String com_subject;
String com_class;
String com_cont;
Date com_date;
int com_readcount;
String com_file;
int com_re_ref;
int com_re_lev;
int com_re_seq;

public int getCom_num() {
	return com_num;
}
public void setCom_num(int com_num) {
	this.com_num = com_num;
}
public String getCom_id() {
	return com_id;
}
public void setCom_id(String com_id) {
	this.com_id = com_id;
}
public String getCom_pass() {
	return com_pass;
}
public void setCom_pass(String com_pass) {
	this.com_pass = com_pass;
}
public String getCom_name() {
	return com_name;
}
public void setCom_name(String com_name) {
	this.com_name = com_name;
}
public String getCom_subject() {
	return com_subject;
}
public void setCom_subject(String com_subject) {
	this.com_subject = com_subject;
}
public String getCom_class() {
	return com_class;
}
public void setCom_class(String com_class) {
	this.com_class = com_class;
}
public String getCom_cont() {
	return com_cont;
}
public void setCom_cont(String com_cont) {
	this.com_cont = com_cont;
}
public Date getCom_date() {
	return com_date;
}
public void setCom_date(Date com_date) {
	this.com_date = com_date;
}
public int getCom_readcount() {
	return com_readcount;
}
public void setCom_readcount(int com_readcount) {
	this.com_readcount = com_readcount;
}
public String getCom_file() {
	return com_file;
}
public void setCom_file(String com_file) {
	this.com_file = com_file;
}
public int getCom_re_ref() {
	return com_re_ref;
}
public void setCom_re_ref(int com_re_ref) {
	this.com_re_ref = com_re_ref;
}
public int getCom_re_lev() {
	return com_re_lev;
}
public void setCom_re_lev(int com_re_lev) {
	this.com_re_lev = com_re_lev;
}
public int getCom_re_seq() {
	return com_re_seq;
}
public void setCom_re_seq(int com_re_seq) {
	this.com_re_seq = com_re_seq;
}
}
