package com.Emp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Emp.entity.Emp;



@Repository
public class EmpDaoImpl implements EmpDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public int saveEmp(Emp emp) {
		// TODO Auto-generated method stub
		int i=(Integer)hibernateTemplate.save(emp);		
		return i;
	}

	@Transactional
	public Emp getEmpById(int id) {
		// TODO Auto-generated method stub
		Emp emp=hibernateTemplate.get(Emp.class,id );
		return emp;
	}

	@Override
	public List<Emp> getAllEmp() {
		// TODO Auto-generated method stub
		List<Emp> list=hibernateTemplate.loadAll(Emp.class);
		return list;
	}

	@Transactional
	public void update(Emp emp) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(emp);
		
	}

	@Transactional
	public void deleteEmp(int id) {
		// TODO Auto-generated method stub
		Emp emp=hibernateTemplate.get(Emp.class, id);
		hibernateTemplate.delete(emp);
	
		
	}

}
