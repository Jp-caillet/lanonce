package fr.lannonce.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import fr.lanonce.beans.LanDto;
import fr.lanonce.beans.TournoisDto;

public interface SearchGameDao {
	List<HashMap<Integer, LanDto>>  getAllNameGameCheck(String l);
}
