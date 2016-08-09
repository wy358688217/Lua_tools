local class = {}
local platform_id = 1 --1:android  2:iOS
local device_id
local user_token
local cache_token
local user_agent
local version

function class.set_platform_id( _platform_id )
	platform_id = _platform_id
end

function class.get_platform_id()	
	return platform_id  
end

function class.set_device_id( _device_id )
	device_id = _device_id
end

function class.get_device_id()	
	return device_id
end

function class.set_user_token( _user_token )
	user_token = _user_token
end

function class.get_user_token()
	return user_token
end

function class.set_cache_token( _cache_token )
	cache_token = _cache_token
end

function class.get_cache_token()
	return cache_token
end

function class.set_user_agent( _user_agent )
	user_agent = _user_agent
end

function class.get_user_agent()
	return user_agent
end

function class.set_version( _version )
	version = _version
end

function class.get_version()
	return version
end

return class