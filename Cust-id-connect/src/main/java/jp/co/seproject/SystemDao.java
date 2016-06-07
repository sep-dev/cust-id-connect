package jp.co.seproject;

import java.io.Serializable;
import java.util.List;

public interface SystemDao<T> extends Serializable {

	public List<T> getCusAll();

	public CustomerData findByCusId(int id);

	public void addCus(CustomerData customerdata);

    public void updateCus(CustomerData customerdata);


}
