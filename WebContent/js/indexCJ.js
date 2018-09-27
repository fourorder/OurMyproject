var MoniterIndex = function(config) {
    var self = this;
   
    var showTreeSelectData = function () {
         $.ajax({
            url: "../powder/toFindCharacterr.action",
            dataType:"json",
      		 type:"post",
            success: function (redata) {
                console.log(redata);
                var datas = {};
                for (var i = 0; i < redata.length; i++) {
                    datas.i = i+1;
                    datas.rolename = redata[i].characterName;
                    datas.createTime = redata[i].characterTime;
                    datas.roleDescription = redata[i].characterIntro;
                    var source = $("#treeSelect-template").html();
                    var template = doT.template(source);
                    var htmlstr = template(datas);
                    $("#treeSelectBody").append(htmlstr);
                }

            },
            error: function (res) {
                console.log(res);
            }
        }); 

       

    }


    self.initData = function () {
        showTreeSelectData(); 
    }
   







}


$(function() {
    window.monitorIndex = new MoniterIndex();
    monitorIndex.initData();
});

var roledId2;
var delRoleId;
$(function () {
    $("#treeSelectBody").on('click', '.grantAuthorityBtn', function () {
        var username = $(this).parents('tr').find('td').eq(1).text();
      var roleId= $(this).parents('tr').find('button').eq(0).data("id");
        //alert( $(this).parents('tr').find('button').eq(1).data("id"));
      roledId2=roleId;
  //------------------
        var html='<select id="authorifyselect" multiple="multiple" onChange="">';
      
        $("#authorityBody").append("<select id='authorifyselect' multiple='multiple' onChange=''>");
        $.ajax({
            url: "../powder/toFindAllMenuu.action",
            data:"roleId="+roleId,
            dataType:"json",
   		 type:"post",
            success: function (redata) {
          
             var map=redata;
             //alert(Object.getOwnPropertyNames(map).length);
           
              for(var key in map){
            //	  alert(key+map[key]);
            	  var list=map[key];
            	  for(var i=0;i<list.length;i++){
            //		  alert(list[i].authorityName);
            		// html.append('<option  value='+list[i].authorityId +'data-section='+key +'  >'+list[i].authorityName+'</option>'); 
            		//  $("#authorityBody").append('<option  value='+list[i].authorityId +'data-section='+key +'  >'+list[i].authorityName+'</option>');	  
          
            		  if(list[i].state==0){
            			  html+='<option  value='+list[i].authorityId +' data-section='+key +'  >'+list[i].authorityName+'</option>';
            			     
            		  }
            		  if(list[i].state==1){
            			  html+='<option  value='+list[i].authorityId +' data-section='+key +' selected  >'+list[i].authorityName+'</option>';
           			    
            		  }
            		    //     	  html+="<option  value='"+list[i].authorityId+"' data-section='"+key+"' selected>"+list[i].authorityName+"</option>";

            	  }
            	  
              }
              html+='</select>';
            //  alert("html="+html); 
              $("#authorityBody").empty().append(html);
              $("#authorifyselect").treeMultiselect({ searchable: true, hideSidePanel: true });
              $("#AuthorityTitle").text("给 " + username + " 分配权限");
              $("#grantAuthorityModal").modal('show');
            }
        });
       // html.append('</select>');
       
      //  $("#authorityBody").append('</select>');
   //----------------------     
       /* var html = 
                  '<option  value="monitor_index" data-section="旅游管理" data-description="首页描述" selected>首页</option>' +
                  '<option  value="manage_logs" data-section="旅游管理" data-description="用户日志描述" selected>用户信息</option>' +
                  '<option  value="interface_logs" data-section="旅游管理" data-description="接口调用日志描述" selected>酒店信息</option>' +
                  '<option  value="abnormal_logs" data-section="旅游管理">出行信息</option>' +
                  '<option  value="empty_logs" data-section="旅游管理">景点信息</option>' +
                  '<option  value="monitor_api" data-section="系统监控" selected>用户监控</option>' +
                  '<option  value="monitor_apiback" data-section="系统监控">车辆监控</option>' +
                  '<option  value="monitor_usercert" data-section="系统监控">酒店监控</option>' +
                  '<option  value="monitor_processor" data-section="系统监控">景点监控</option>' +
                  '<option  value="monitor_connector" data-section="系统监控" selected>导游监控</option>' +
                  '<option  value="monitor_agent" data-section="系统监控">旅客监控</option>' +
                  '<option  value="monitor_dispatcher" data-section="系统监控">地铁监控</option>' +
                  '<option  value="monitor_dbreceive" data-section="系统监控">天气监控</option>' +
                  '<option  value="monitor_dbquery" data-section="系统监控">就餐监控</option>' +
                  '<option  value="monitor_backFile" data-section="系统监控">成员监控</option>' +
                  '<option  value="manage_staff" data-section="用户权限">用户管理</option>' +
                  '<option  value="manage_role" data-section="用户权限">角色管理</option>' +
                  '<option  value="interface_test" data-section="接口测试">开始测试</option>' +
                  '</select>';*/
       
    });
    
 //--------------------------------------  
    $("#treeSelectBody").on('click', '.deleteBtn', function () {
    	  delRoleId= $(this).parents('tr').find('button').eq(1).data("id");
    	// alert("确认删除该角色吗？");
    	 $("#delmymodal").modal();
    }); 
   //------------------------------------
 
    
    //----------------------------
})

			 
	$('#authoritysubmit').click(function(){
    //alert('AA');
    var arrayObj = new Array();
		$('select :selected').each(function() {
	console.log($(this).val());
	var menuList=$(this).val();
//	alert(menuList);
	arrayObj.push(menuList);
	
	});
	//	alert(roledId2);
	//	alert("菜单ID数组="+arrayObj);
		//---------------------ajax--------------
		 $.ajax({
	         url: "../powder/toSubmitPower.action",
	         data:"arrayObj="+arrayObj+"&roldId="+roledId2,
	         dataType:"json",
			 type:"post",
	         success: function (redata) {
	        	 
	        	 
	         			}
	        
	         });
	//-----------------------------	
	
})

$('#submitAddRole').click(function(){
	var roleIntro=$('#roleIntro').val();
	var roleName=$('#roleName').val();
	
	if($('#roleName').val()==""){
		
		 alert("角色名称不能为空");
		return false;
	}
if($('#roleIntro').val()==""){
		
	 alert("角色描述不能为空");
		return false;
	}
	
// 验证该角色是否存在

$.ajax({
    url: "../powder/findRoleExist.action",
    data:"roleName="+roleName,
    dataType:"json",
	 type:"post",
    success: function (redata) {
    	 var list=redata;
    	 var len = list.length;
    	 
    	 if(len!=0){
    		 alert("改角色已存在！");
    		 return false;
    		 
    	 }else{
    		 $.ajax({
    			    url: "../powder/toAddRole.action",
    			    data:"roleIntro="+roleIntro+"&roleName="+roleName,
    			    dataType:"json",
    				 type:"post",
    			    success: function (redata) {
    			    	$("#treeSelectBody").empty();
    			    	 var list=redata;
    			    	 var len = list.length;
    			    	//----------
    			    	 
    			    	 for(var i=0;i<len;i++){    			        	 
    			             var e = list[i];
    				           if(e.characterId>4){
    				        	   $("#treeSelectBody").append("<tr><td>"+(i+1)+" </td><td>"+e.characterName+" </td><td>"+e.characterTime+" </td><td>"+e.characterIntro+" </td><td>"
    					            		+  "<button class='btn btn-primary btn-sm grantAuthorityBtn rightSize' type='button'  data-id="+ e.characterId +" id="+e.characterId+"><i class='fa fa-external-link'></i>授权</button>"
    					            		
    					            		+  "<button class='btn btn-danger btn-sm deleteBtn rightSize'                  type='button'  data-id="+ e.characterId +" id="+e.characterId+"><i class='fa fa-paste'></i>删除</button>"
    					           +"</td></tr>"
    					             );
    				           }
    				            if(e.characterId<=4){
    				            	 $("#treeSelectBody").append("<tr><td>"+(i+1)+" </td><td>"+e.characterName+" </td><td>"+e.characterTime+" </td><td>"+e.characterIntro+" </td><td>"
    						            		+  "<button class='btn btn-primary btn-sm grantAuthorityBtn rightSize' type='button'  data-id="+ e.characterId +" id="+e.characterId+"><i class='fa fa-external-link'></i>授权</button>"
    						            		
    						            	 
    						           +"</td></tr>"
    						             );
    				            }
    				         
    						 } 	 
    			    	 
    			    	 
    			    	 
    			    	//-------------
    			    			}
    			   
    			    });
    	 }
    	 
    }
});
	//alert(roleIntro+"==="+roleName);
//---------------------------




//------------------

/*$("#submitAddRole").modal('hide'); */
 
	
})


  $('#confirmDelRole').click(function(){

	 alert("要删除的角色id"+delRoleId);
	  //先确认该角色有没有人正在使用
		$.ajax({
		    url: "../powder/confirmRoleUsing.action",
		    data:"delRoleId="+delRoleId,
		    dataType:"json",
			 type:"post",
		    success: function (redata) {
		    	//alert("检查角色是否在使用");
		    	if(redata==1){
		    		
		    		alert("改角色正在被使用，不能删除");
		    		return false;
		    	}else{
		    		
		    		
		    		 $.ajax({
		    			    url: "../powder/confirmDelRole.action",
		    			    data:"delRoleId="+delRoleId,
		    			    dataType:"json",
		    				 type:"post",
		    			    success: function (redata) {
		    			    	$("#treeSelectBody").empty();
		    			    	 var list=redata;
		    			    	 var len = list.length;
		    			    	//----------
		    			    	 
		    			    	 for(var i=0;i<len;i++){    			        	 
		    			             var e = list[i];
		    			           if(e.characterId>4){
		    			        	   $("#treeSelectBody").append("<tr><td>"+(i+1)+" </td><td>"+e.characterName+" </td><td>"+e.characterTime+" </td><td>"+e.characterIntro+" </td><td>"
			    			            		+  "<button class='btn btn-primary btn-sm grantAuthorityBtn rightSize' type='button'  data-id="+ e.characterId +" id="+e.characterId+"><i class='fa fa-external-link'></i>授权</button>"
			    			            		
			    			            		+  "<button class='btn btn-danger btn-sm deleteBtn rightSize'                  type='button'  data-id="+ e.characterId +" id="+e.characterId+"><i class='fa fa-paste'></i>删除</button>"
			    			           +"</td></tr>"
			    			             );
		    			           }
		    			            if(e.characterId<=4){
		    			            	 $("#treeSelectBody").append("<tr><td>"+(i+1)+" </td><td>"+e.characterName+" </td><td>"+e.characterTime+" </td><td>"+e.characterIntro+" </td><td>"
				    			            		+  "<button class='btn btn-primary btn-sm grantAuthorityBtn rightSize' type='button'  data-id="+ e.characterId +" id="+e.characterId+"><i class='fa fa-external-link'></i>授权</button>"
				    			            		
				    			            	 
				    			           +"</td></tr>"
				    			             );
		    			            }
		    			         
		    					 } 	 
		    			    }
		    			}) ; 
		    	}
		    	
		    }
	  
		});
	  //-----------------------------------------------
	  
	  
	
}) 
 