--[[
=================
XMLHttpRequestTest.lua
http����
=================
]]--
require("json")

local function XMLHttpRequestLayer()
  local layer = cc.Layer:create()-- ������
  local winSize = cc.Director:getInstance():getWinSize()-- �õ����ڴ�С
  local margin = 40-- ���
  local space  = 35-- ���

  local function init()
    local label = cc.Label:createWithTTF("XML Http Request Test", s_arialPath, 28)-- ʹ��ttf���ָ�ʽ�ı�ǩ
    label:setAnchorPoint(cc.p(0.5, 0.5))-- ����ê��
    label:setPosition(cc.p(winSize.width / 2, winSize.height - margin))-- ������ʾλ�ã����Ϊ��Ļ���м䣬�߶�Ϊ��Ļ�߶ȼ�ȥ���
    layer:addChild(label, 0) -- ��ӱ�ǩ������

    -- ��ʾ������ı�ǩ
    local labelStatusCode = cc.Label:createWithTTF("HTTP Status Code", s_markerFeltFontPath, 20)
    labelStatusCode:setAnchorPoint(cc.p(0.5, 0.5))
    labelStatusCode:setPosition(cc.p(winSize.width / 2,  winSize.height - margin - 6 * space))
    layer:addChild(labelStatusCode)

    local menuRequest = cc.Menu:create() -- �����˵�
    menuRequest:setPosition(cc.p(0,0))
    layer:addChild(menuRequest) -- ��Ӳ˵�

    --Get
    local function onMenuGetClicked()
      local xhr = cc.XMLHttpRequest:new() -- http����
      xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING -- ��Ӧ����
      xhr:open("GET", "http://httpbin.org/get") -- ������

      -- ״̬�ı�ʱ����
      local function onReadyStateChange()
        -- ��ʾ״̬�ı�
        local statusString = "Http Status Code:"..xhr.statusText
        labelStatusCode:setString(statusString)
        print(xhr.response)
      end

      -- ע��ű��ص�����
      xhr:registerScriptHandler(onReadyStateChange)
      xhr:send() -- ��������

      labelStatusCode:setString("waiting...")
    end

    -- ����Get�ı�ǩ
    local labelGet  = cc.Label:createWithTTF("Test Get", s_arialPath, 22)
    labelGet:setAnchorPoint(cc.p(0.5, 0.5))
    local itemGet  =  cc.MenuItemLabel:create(labelGet) -- �˵���ǩ
    itemGet:registerScriptTapHandler(onMenuGetClicked) -- �˵�����¼�
    itemGet:setPosition(cc.p(winSize.width / 2, winSize.height - margin - space))
    menuRequest:addChild(itemGet) -- ��Ӳ˵���

    --Post
    local function onMenuPostClicked()
      local xhr = cc.XMLHttpRequest:new() -- �½�һ��XMLHttpRequest����
      xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING -- ��Ӧ����Ϊ�ַ���
      xhr:open("POST", "http://httpbin.org/post")-- post��ʽ
      local function onReadyStateChange()
        labelStatusCode:setString("Http Status Code:"..xhr.statusText)
        print(xhr.response)
      end
      -- ע��ű������ص�
      xhr:registerScriptHandler(onReadyStateChange)
      xhr:send()-- ����

      labelStatusCode:setString("waiting...")
    end

    -- ����Post�ı�ǩ
    local labelPost = cc.Label:createWithTTF("Test Post", s_arialPath, 22)
    labelPost:setAnchorPoint(cc.p(0.5, 0.5)) -- ����ê��
    local itemPost =  cc.MenuItemLabel:create(labelPost) -- ���ò˵����ǩ
    itemPost:registerScriptTapHandler(onMenuPostClicked) -- ע��˵������ص�����
    itemPost:setPosition(cc.p(winSize.width / 2, winSize.height - margin - 2 * space))
    menuRequest:addChild(itemPost)

    --Post Binary
    local function onMenuPostBinaryClicked()
      local xhr = cc.XMLHttpRequest:new()-- �½�һ��XMLHttpRequest����
      xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_ARRAY_BUFFER --��������Ϊ�ֽ���
      xhr:open("POST", "http://httpbin.org/post") -- ��Socket

      -- ״̬�ı�ʱ����
      local function onReadyStateChange()
        local response   = xhr.response -- ��÷�������
        local size     = table.getn(response) -- ��÷������ݴ�С
        local strInfo = ""

        for i = 1,size do
          if 0 == response[i] then
            strInfo = strInfo.."\'\\0\'"
          else
            strInfo = strInfo..string.char(response[i])
          end
        end
        labelStatusCode:setString("Http Status Code:"..xhr.statusText)
        print(strInfo)
      end

      -- ע��ű������ص�
      xhr:registerScriptHandler(onReadyStateChange)
      xhr:send()-- ����

      labelStatusCode:setString("waiting...")
    end

    -- ����ʹ��Post����ʽ�����ֽ���
    local labelPostBinary = cc.Label:createWithTTF("Test Post Binary", s_arialPath, 22)
    labelPostBinary:setAnchorPoint(cc.p(0.5, 0.5))
    local itemPostBinary = cc.MenuItemLabel:create(labelPostBinary)
    itemPostBinary:registerScriptTapHandler(onMenuPostBinaryClicked)
    itemPostBinary:setPosition(cc.p(winSize.width / 2, winSize.height - margin - 3 * space))
    menuRequest:addChild(itemPostBinary)

    --Post Json
    local function onMenuPostJsonClicked()
      local xhr = cc.XMLHttpRequest:new() -- �½�һ��XMLHttpRequest����
      xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON -- json��������
      xhr:open("POST", "http://httpbin.org/post")-- POST��ʽ

      local function onReadyStateChange()
        -- ��ʾ״̬��,�ɹ���ʾ200
        labelStatusCode:setString("Http Status Code:"..xhr.statusText)
        local response   = xhr.response -- �����Ӧ����
        local output = json.decode(response,1) -- ����json����
        table.foreach(output,function(i, v) print (i, v) end)
        print("headers are")
        table.foreach(output.headers,print)
      end

      -- ע��ű������ص�
      xhr:registerScriptHandler(onReadyStateChange)
      xhr:send()-- ��������

      labelStatusCode:setString("waiting...")
    end

    -- ����ʹ��POST��ʽ����json�ı�ǩ
    local labelPostJson = cc.Label:createWithTTF("Test Post Json", s_arialPath, 22)
    labelPostJson:setAnchorPoint(cc.p(0.5, 0.5)) -- ê��
    local itemPostJson = cc.MenuItemLabel:create(labelPostJson) -- �˵����ǩ
    itemPostJson:registerScriptTapHandler(onMenuPostJsonClicked) -- ע��˵�����
    itemPostJson:setPosition(cc.p(winSize.width / 2, winSize.height - margin - 4 * space))
    menuRequest:addChild(itemPostJson)
  end


  -- �ڵ�ص��¼�
  local function onNodeEvent(eventName)
    if "enter" == eventName then
      init()
    end
  end

  -- ע���ļ����ص��¼�
  layer:registerScriptHandler(onNodeEvent)

  return layer
end

function XMLHttpRequestTestMain()
  local scene = cc.Scene:create() -- ��������
  scene:addChild(XMLHttpRequestLayer()) -- ��Ӳ�
  scene:addChild(CreateBackMenuItem()) -- ��ӷ��ز˵������ʵ�ֲ鿴helper.lua�ļ�
  return scene
end
