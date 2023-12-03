package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Board;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession = null;

	@Autowired
	public BoardDAOImpl(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public void createBoard(Board board) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("mapper.BoardMapper.insert", board);

		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Board readBoard(int bno) {
		// TODO Auto-generated method stub
		Board board;
		try {
			sqlSession = sqlSessionFactory.openSession();
			board = sqlSession.selectOne("mapper.BoardMapper.view", bno);
		} finally {
			sqlSession.close();
		}

		return board;
	}

	@Override
	public void updateBoard(Board board) {
		// TODO Auto-generated method stub
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("mapper.BoardMapper.updateArticle", board);

		} finally {
			sqlSession.close();
		}

	}

	@Override
	public void increaseViewcnt(int bno) {
		// TODO Auto-generated method stub
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("mapper.BoardMapper.increaseViewcnt", bno);

		} finally {
			sqlSession.close();
		}

	}

	@Override
	public List<Board> selectAllBoard() {
		// TODO Auto-generated method stub
		List<Board> boardList;
		try {
			sqlSession = sqlSessionFactory.openSession();
			boardList = sqlSession.selectList("mapper.BoardMapper.listAll");

		} finally {
			sqlSession.close();
		}

		return boardList;
	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub

		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.delete("mapper.BoardMapper.deleteArticle", bno);

		} finally {
			sqlSession.close();
		}

	}

}
