package com.example.publicwifi.data;

import java.util.List;

public class HistoryService {

    public List<HistWifi> list() {
        HistDao histDao = new HistDao();
        return histDao.selectAll();
    }

    public void save(HistWifi histWifi) {
        HistDao histDao = new HistDao();
        histDao.insert(histWifi);
    }


}
