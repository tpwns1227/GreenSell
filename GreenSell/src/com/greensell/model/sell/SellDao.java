package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public interface SellDao {
	
	public List<ItemSellVO> allitemList() throws SQLException; //紐⑤�� ��留ㅺ� 由ъ�ㅽ�� 異���  
	
	public List<ItemSellVO> olditemList(String howsell) throws SQLException; //以�怨�臾쇳�� 由ъ�ㅽ�� 異���
	
	public List<AuctionVO> auctionitemList() throws SQLException; //寃쎈ℓ臾쇳�� 由ъ�ㅽ�� 異���
	
	public List<String> getImagenames(int no) throws SQLException; //�대�몄��� �대��� 媛��몄�ㅺ린
	
	public boolean itemInsert(ItemSellVO itsv) throws SQLException; //臾쇳�� �깅�
	
	public List<ItemSellVO> itemDetail(int no) throws SQLException;//臾쇳�� ���몃낫湲�
	
	public boolean itemUpdate(ItemSellVO itsv) throws SQLException; //臾쇳�� 湲� ���곗�댄��
	
	public boolean itemDelete(int no) throws SQLException;//臾쇳�� 寃���湲� ����
	
	public boolean auctionDelete(int no) throws SQLException;//寃쎈ℓ�� 寃쎌�� ���� 
}