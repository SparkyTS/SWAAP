package com.swaap.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swaap.model.BranchVO;
@Repository
public class BranchDAOImpl implements BranchDAO{
	@Autowired
	SessionFactory sessionFactory;

	public void insertBranch(BranchVO branchVO) 
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(branchVO);		
	}

	@Override
	public List searchBranch() {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from BranchVO where status=true and stateVO.status=true");
		List branchList=q.list();
		return branchList;
	}

	@Override
	public List editBranch(BranchVO branchVO) {
		Session session = sessionFactory.openSession();		
		Query q=session.createQuery("from BranchVO where id="+branchVO.getId());		
		List branchList=q.list();
		return branchList;
	}

}
