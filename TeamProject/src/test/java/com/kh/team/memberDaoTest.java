package com.kh.team;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class memberDaoTest {

	@Inject
	SqlSession sqlsession;
	
	@Inject
	SqlSessionFactory sqlsessionFactory;
	
	@Test
	public void testDao() {
		System.out.println(sqlsession);
		System.out.println(sqlsessionFactory);
	}
}
