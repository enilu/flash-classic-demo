package cn.enilu.flash.common.modules.system.service;

import cn.enilu.flash.common.modules.system.entity.Permission;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.db.Query;
import cn.enilu.flash.core.service.EntityService;
import cn.enilu.flash.web.QueryForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PermissionService extends EntityService<Permission, Long> {
	private Logger logger = LoggerFactory.getLogger(PermissionService.class);

	public PermissionService() {
		super(Permission.class);
	}

	@Transactional
	public Pagination<Permission> search(QueryForm qf) {
		Query q = db.from("permission");
		qf.setupLikeConditions(q, "name");
		return q.orderBy(qf.getOrderBy()).paginate(Permission.class, qf.getPage());
	}
}
