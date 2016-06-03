package jp.co.seproject;

import java.io.Serializable;
import java.util.List;



public interface SystemDao<T> extends Serializable{

	public List<T> getAll();

	public void add(T data);



}
