package proj21_movie.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;

import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_movie.config.ContextRoot;
import proj21_movie.dto.Notice;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class NoticeMapperTest {

	@Autowired
	private NoticeMapper mapper;

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test05SelectNoticeByNo() {
		Notice notice = mapper.selectNoticeByNo(7);
		Assert.assertNotNull(notice);
	}

	@Test
	public void test02SelectNoticeByTitle() {
		fail("Not yet implemented");
	}

	@Test
	public void test03SelectNoticeAll() {
		List<Notice> list = mapper.selectNoticeAll();
		Assert.assertNotNull(list);
	}

	@Test
	public void test04UpdateNotice() {
		Notice notice = new Notice();
		notice.setNotNo(7);
		notice.setNotTitle("inserttest 글 수정");
		notice.setNotDetail("inserttest 글 세부내용 수정");
		notice.setNotFile("inserttest 글 파일 경로 수정");
		int res = mapper.updateNotice(notice);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test01InsertNotice() {
		Notice notice = new Notice();
		notice.setNotTitle("inserttest 글");
		notice.setNotDetail("inserttest 글 세부내용");
		notice.setNotFile("inserttest 글 파일 경로");
		int res = mapper.insertNotice(notice);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test06DeleteNotice() {
		int res = mapper.deleteNotice(7);
		Assert.assertEquals(1, res);
	}

}
