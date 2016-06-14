package jp.co.seproject;

import java.io.Serializable;
import java.util.List;

public interface SystemDao<T> extends Serializable {

    //CustamerData
	public List<T> getAll();

	public T findById(Long l);

	public void add(T data);

    public void update(T data);

    public void delete(int id);

    public void delete(T data);

	public T findById(int id);

   /* //CardData
    public List<CardData> getCardAll();

    public CardData findByCardId(int id);

    public void addCard(CardData Carddata);

    public void updateCard(CardData carddata);

    public void deleteCard(int id);*/



}
