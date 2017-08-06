package cn.enilu.flash.common.system.service;

import cn.enilu.flash.common.system.entity.SysNotification;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.db.Query;
import cn.enilu.flash.core.service.EntityService;
import cn.enilu.flash.web.QueryForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SysNotificationService extends EntityService<SysNotification, Long> {
	private Logger logger = LoggerFactory.getLogger(SysNotificationService.class);

	public SysNotificationService() {
		super(SysNotification.class);
	}

	@Transactional
	public Pagination<SysNotification> search(QueryForm qf) {
		Query q = db.from("sys_notification");
		qf.setupLikeConditions(q, "title");
		return q.orderBy(qf.getOrderBy()).paginate(SysNotification.class, qf.getPage());
	}
}
