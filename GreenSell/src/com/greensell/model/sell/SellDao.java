package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public interface SellDao {
	
	public List<ItemSellVO> allitemList() throws SQLException; //��ü ��� �Ѹ���  
	
	public List<ItemSellVO> olditemList(String howsell) throws SQLException; //�߰� ����Ʈ
	
	public List<AuctionVO> auctionitemList() throws SQLException; //��� ����Ʈ
	
	public List<String> getImagenames(int no) throws SQLException; //��ǰ �̹��� �̸� ��������
	
	public boolean itemInsert(ItemSellVO itsv) throws SQLException; //��ǰ �߰��ϱ�
	
	public List<ItemSellVO> itemDetail(int no) throws SQLException;//��ǰ �󼼺���
	
	public boolean itemUpdate(int no) throws SQLException; //��ǰ �Խñ� ������Ʈ
	
	public boolean itemDelete(int no) throws SQLException;//��ǰ �Խñ� ����
}
