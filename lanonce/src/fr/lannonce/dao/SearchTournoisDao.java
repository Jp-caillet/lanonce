package fr.lannonce.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import fr.lanonce.beans.TournoisDto;

public interface SearchTournoisDao {
	List<HashMap<Integer, TournoisDto>> getAllTournoisCheck(String l);
}
