package cn.enilu.flash.common.modules.system.service;

import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.db.Query;
import cn.enilu.flash.core.service.EntityService;
import cn.enilu.flash.common.modules.system.entity.Logs;
import cn.enilu.flash.web.QueryForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LogsService extends EntityService<Logs, Long> {
	private Logger logger = LoggerFactory.getLogger(LogsService.class);

	public LogsService() {
		super(Logs.class);
	}

	@Transactional
	public Pagination<Logs> search(QueryForm qf) {
		Query q = db.from("logs");
		qf.setupEqConditions(q,  "operator");
		qf.setupLikeConditions(q, "action");
		return q.orderBy(qf.getOrderBy()).paginate(Logs.class, qf.getPage());
	}
}
