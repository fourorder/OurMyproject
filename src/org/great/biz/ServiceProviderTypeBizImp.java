package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.ServiceProviderTypeBean;

import org.great.mapper.ServiceProviderTypeMapper;
import org.springframework.stereotype.Service;

@Service
public class ServiceProviderTypeBizImp implements ServiceProviderTypeBiz {
	@Resource
	private ServiceProviderTypeMapper serviceProviderTypeMapper;
		@Override
		public List<ServiceProviderTypeBean> countServiceProviderType(String parameterName) {
			// TODO Auto-generated method stub
			if (parameterName!=null) {
				parameterName="%"+parameterName+"%";
			}
			return serviceProviderTypeMapper.countServiceProviderType(parameterName);
		}

		@Override
		public List<ServiceProviderTypeBean> serviceProviderType(String parameterName, int page) {
			// TODO Auto-generated method stub
			if (parameterName!=null) {
				parameterName="%"+parameterName+"%";
			}
			return serviceProviderTypeMapper.serviceProviderType(parameterName,page);
		}

		@Override
		public void addServiceProviderType(String parameterName3) {
			// TODO Auto-generated method stub
			serviceProviderTypeMapper.addServiceProviderType(parameterName3);
		}

		@Override
		public void changeState(int parameterId) {
			// TODO Auto-generated method stub
			serviceProviderTypeMapper.changeState(parameterId);
		}

	}
