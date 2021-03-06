<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <title>Main</title>
        <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/core-main.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-01.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-02.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub-03.css">
        <link href="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.css" rel="stylesheet">
    	<script src="<%=request.getContextPath() %>/resources/summerNote/summernote-lite.min.js"></script>
    	<script src="<%=request.getContextPath() %>/resources/summerNote/summernote.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
        <script src="https://kit.fontawesome.com/b6e2c7fefa.js" crossorigin="anonymous"></script>
        <style type="text/css">
        
	        #formselect {
	        	    border: 1px solid #ddd;
				    border-radius: 3px;
				    padding: 5px 15px 5px 10px;
				    width: 100%;
	        }
	        
	        #formInput {
    			padding: 15px 15px;
			}
			
			#formInput-ul li{
				padding: 5px;	
			}
			
			input[role='formInputValues']{
				border: 1px solid #ddd;
			    border-radius: 3px;
			    padding: 5px 15px 5px 10px;
			    width: 90%;

			}
			.detail-con .de-bot .de-con {
			    width: 100%;
			    padding: 30px 30px;
			}
			
        </style>
   </head>
<script>
  

</script>

<body >
	<form action="<%=request.getContextPath() %>/setle/modify" method="post" id="submitForm" enctype="multipart/form-data">
       <div class="wrap">
        <div class="top-bar flex ju-sp-bt al-it-ce">
            <%@ include file="/WEB-INF/include/topbar.jsp" %>
        </div>

            <div class="container flex">
             

            <div class="content">
                <div class="approval-wrap">
                    <div class="approval-regist">
                        <div class="approval-title flex al-it-ce">
                            <i class="fa-solid fa-file-pen"></i>
                            <input type="text" class="app-title" name="setleSj" value="${setle.setleSj }">
                        </div>

                        <div class="approval-content flex ju-sp-bt">
                            <div class="app-con con01">
                                <div class="app-tab con01 flex ju-sp-bt al-it-ce">
                                    <ul class="flex">
                                        <li><a href="#tab01" class="active">????????????</a></li>
                                        <li><a href="#tab02">??????</a></li>
                                    </ul>

                                    <div class="all-down">
                                        <span>?????? ????????????</span>
                                    </div>
                                </div>

                                <div class="app-tabcontent">
                                    <div id="tab01">
                                        <div class="filebox flex mb-20" id="file-attach-div">
                                            <input class="upload-name" value="????????????" placeholder="????????????">
                                            <label style="cursor: pointer;" onclick="fileAdd()">????????????</label> 
                                            <input type="file" id="file" name="uploadFile" multiple="multiple">
                                        </div>

											<c:forEach var="attach" items="${setle.setleAttachList }">
		                                        <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this);">
		                                            <i class="fa-solid fa-file-lines"></i>
		                                            <span>${attach.originalname }</span>
		                                            <i class="fa-solid fa-xmark"></i>
		                                            <input type="hidden" value="${attach.ano}" name=savedAttach>
		                                        </div>
                                        	</c:forEach>
<!--                                         <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this)"> -->
<!--                                             <i class="fa-solid fa-file-lines"></i> -->
<!--                                             <span>????????? ?????? ????????????</span> -->
<!--                                             <i class="fa-solid fa-download"></i> -->
<!--                                             <i class="fa-solid fa-xmark"></i> -->
<!--                                         </div> -->
                                        

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce">
                                                <i class="fa-solid fa-list"></i> 
                                                <span>${loginEmp.name}??? ?????? ?????????</span>
                                            </div>

                                            <div class="de-bot flex">
                                            

                                                <div class="de-con">
                                                    <div class="wri-info flex ju-sp-bt al-it-ce">
                                                        <div class="de-name">
                                                            <h1>${loginEmp.name}</h1>
                                                            <span>${loginEmp.ncnm}</span>
                                                        </div>

                                                        <div class="de-part">
                                                            <span><i class="fa-solid fa-briefcase"></i>${loginEmp.dept }</span>
                                                            <em></em>
                                                        </div>
                                                    </div>

                                                    <div class="re-detail">
                                                        <ul>
                                                            <li>
                                                                <i class="fa-solid fa-pen"></i>
                                                                ????????? : 
                                                                <span>2022. 01. 02</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                ???????????? :
                                                                <input type="date" name="evlStartDate" class="evlDate" value='<fmt:formatDate value="${setle.evlStartDate }" pattern="yyyy-MM-dd"/>'> ~ <input type="date" name="evlEndDate" class="evlDate" value='<fmt:formatDate value="${setle.evlEndDate }" pattern="yyyy-MM-dd"/>'> 
                                                            </li>

                                                            
                                                            <li>
                                                                <i class="fa-solid fa-users"></i>
                                                                ???????????? :
                                                                <span>???????????? (30)</span>
                                                            </li>

                                                            <li>
                                                                <i class="fa-solid fa-calendar-days"></i>
                                                                ???????????? :
                                                                <input type="date" name="agrStartDate" class="evlDate" value='<fmt:formatDate value="${setle.agrStartDate }" pattern="yyyy-MM-dd"/>'> ~ <input type="date" name="agrEndDate" class="evlDate" value='<fmt:formatDate value="${setle.agrStartDate }" pattern="yyyy-MM-dd"/>'>
                                                            </li>

                                                            <li>
                                                                <div class="flex al-it-ce mb-10">
                                                                <i class="fa-solid fa-users" style="margin-right: 13px"></i>
                                                                 ???????????? :
                                                                <div class="aggre-mem">
                                                                    <select id="depart-selector">
                                                                        <option>??????</option>
                                                                        <c:forEach items="${departList}" var="depart">
                                                                        	<option value="${depart.dept_nm }">${depart.dept_nm }</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                    <select id="depart-emp-seletor">
                                                                        <option value="notSelect">??????</option>
                                                                    </select>

                                                                    <button type="button" id="add-setle-emp"><i class="fa-solid fa-plus"></i></button>
                                                                </div>
                                                                </div>

                                                                <div class="se-mem" id="selected-depart-emp">
                                                                <c:forEach var="setleEmp" items="${setle.setleEmpList }">
                                                               		<span class="seleted-emp-span" onclick='removeSelected(this);'>${setleEmp.empNm}<i class="fa-solid fa-xmark"></i><input type="hidden" name="setleEmpList" value="${setleEmp.emplNo }/${setleEmp.empNm }"></span>
                                                               	</c:forEach>
<!--                                                                     <span class="seleted-emp-span">????????? <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>????????? <i class="fa-solid fa-xmark"></i></span> -->
<!--                                                                     <span>????????? <i class="fa-solid fa-xmark"></i></span> -->
                                                                </div>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <div class="regist-box" id="regist-box">
                                                    <h4>????????????</h4>

                                                    
                                                        <div class="editor">
                                                            <textarea id="summernote" name="setleCn" >${setle.setleCn }</textarea>
                                                        </div>
	                                                    
                                                  	</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div id="tab02">
                                        <div class="file">
                                            <i class="fa-solid fa-file-lines"></i>
                                            <span>????????? ?????? ????????????</span>
                                            <i class="fa-solid fa-download"></i>
                                        </div>

                                        <div class="detail-con">
                                            <div class="de-top flex al-it-ce ju-sp-bt">
                                                <i class="fa-solid fa-list"></i> 
                                                <!-- <select id="formselect" onchange="formChange();">
                                                	<option value="form1" id="">???????????????</option>
                                                	<option value="form2" id="">???????????????</option>
                                                	<option value="form3" id="">???????????????</option>
                                                	<option value="form4" id="">?????????</option>
                                                	<option value="form5" id="">???????????????</option>
                                                </select> -->
                                                <div class="print">
                                                	<i class="fa-solid fa-print"></i>
                                                	<input type="button" id="formPrint" value="??????" >
                                                </div>
                                                
                                            </div>

                                            <div class="de-bot flex" style="overflow: scroll;" >
                                                <div id="setle-formdiv" style="heimin-height :297mm; min-width: 210mm;"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
							<div class="app-con con02">	                                                    
	                            <div class="app-btntab">
	                                    <ul class="flex ju-sp-bt">
	                                        <select id="formselect" name="setleFormNo" required="required">
				                             <option value="-1" id="" selected="selected">????????????</option>
				                             <option value="1" id="" <c:if test="${setle.setleFormNo eq 1 }">selected="selected"</c:if>>???????????????</option>
				                             <option value="2" id="">???????????????</option>
				                             <option value="3" id="">???????????????</option>
				                             <option value="4" id="">?????????</option>
				                             <option value="5" id="">???????????????</option>
		                       	 			</select>
	                                    </ul>
	                             </div>
                            	
                                <br>
                                <div id=formInput>
<!--                             		<label>??????</label><input type="text" id="??????" name="??????"/>    -->
                                </div> 
                                <br>
                                <input type="button" value="??????" id="inputToForm"/>
                           	</div>
                            

                        
                    </div>
                </div>

                
                <div class="page-btn flex ju-sp-ce">
                    <button type="button" class="back" onclick="backPage();">????????????</button>
                    <button type="button" class="regist" onclick="regist_setle();">????????????</button>
                </div>
            </div>

       </div>
      </div>
      <input type="hidden" value="${loginEmp.empl_no }" name="setleWriter">
      <input type="hidden" value="${loginEmp.dept }" name="writerDepart">
      <input type="hidden" value="${setle.setleNo }" name="setleNo">
      <input type="hidden" value="${setle.formInputs }" name="formInputs">
	  </form>
     <script>
     summernote_go($('#summernote'),'<%=request.getContextPath()%>');
    </script>
    <script>
    	var formdoc = ``;
		
		var writedoc = "";
		var inputstrArr = [];
    
    	$('#formPrint').on("click",function(){
    		  let $container = $("#setle-formdiv").clone()    // ????????? ??? ?????? ?????? ??????
    		    let cssText = ""                            // ????????? ??????
    		    for (const node of $("style")) {
    		        cssText += node.innerHTML
    		    }
    		    /** ?????? */
    		    let innerHtml = $container[0].innerHTML
    		    let popupWindow = window.open("", "_blank", "width=700,height=800")
    		    popupWindow.document.write("<!DOCTYPE html>"+
    		      "<html>"+
    		        "<head>"+
    		        "<style>"+cssText+"</style>"+
    		        "</head>"+
    		        '<body style=" height :297mm; width: 210mm;"><div style="align:center;">'+innerHtml+'</body>'+
    		      "</html>")
    		   
    		    popupWindow.document.close()
    		    popupWindow.focus()

    		    /** 1??? ?????? */
    		    setTimeout(() => {
    		        popupWindow.print()         // ????????? ????????? ?????? ??????
    		        popupWindow.close()         // ????????? ?????? ????????? ?????? ?????? ??????
    		    }, 1000)

    	});
    	
    	function boundarySearch(str){
    		
    		var nowIndex = 0;
    		var searchStr = [];
    			
    		while(true){
    			
    			
    			
    			var sindex = str.indexOf("{{" , nowIndex);
    			nowIndex = sindex;
    			if(nowIndex==-1){
    				break;
    			}
    			var eindex = str.indexOf("}}", nowIndex);
    			nowIndex = eindex;
    			
    			searchStr.push(str.substring(sindex+2,eindex));
    		}
    		
    		var set = new Set(searchStr);
    		searchStr = [...set];
    		
    		return searchStr;
    	}
    	
    	
    	
    	
    	
    	$('#inputToForm').on('click',function(){
    		var input;
    		writedoc = formdoc;
    		for(var str of inputstrArr){
    			input = $("#"+str);
    			var namestr = $(input).attr('name');
    			var valstr = $(input).val();
    			writedoc = writedoc.replaceAll("{{"+namestr+"}}",valstr);
    			
    		}
    		
    		$('#setle-formdiv').html(writedoc);
    		
    		var formInputNode = document.querySelectorAll('input[role=formInputValues]');
			if(document.querySelector('input[name="formInputs"]')){
				var formInputValues = document.querySelector('input[name="formInputs"]');
			}else{
	    		var formInputValues = document.createElement("input");
				formInputValues.setAttribute("name","formInputs");
			}
			
			
			console.log(formInputValues.name);
			
			formInputValues.value = JSON.stringify(inputToJsonByName(formInputNode));
			
			$("#submitForm").append(formInputValues);
			
			
			
    		
    	});
    	
    	function checkInputHidden(str){
    		
    		var check = str.indexOf("??????") != -1;
    		check = check || (str.indexOf("??????") != -1);
    		
    		
    		
    		
    		return check;
    	}
    	
$('#formselect').on('change',function(){
    		
    		if($(this).val() != -1){
    		
    			$.ajax({
    				type : "get",
    				url : "formTextByNo",
    				data : {FormNo : $(this).val()},
    				dataType:"text",
    				success: function(data){
    					formdoc = data;
    					
    					var inputHtml = "<ul id='formInput-ul'>";
    	    			
    	    			inputstrArr = boundarySearch(formdoc);
    	    			
    	    			for(var str of inputstrArr){
    	    				
    	    				if(checkInputHidden(str)){
    	    					inputHtml = inputHtml + "<li><input type='hidden' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/></li>";
    	    				}else if(str.indexOf("??????") != -1){
    	    					inputHtml = inputHtml + "<li><label>"+str+"</label><input type='date' id="+str+" name="+str+" placeholder="+str+" role='formInputValues'/></li>";
    	    				}else{
    	    				
    	    					inputHtml = inputHtml + "<li><input type='text' id="+str+" name="+str+" placeholder="+str+" role='formInputValues' /></li>"
    	    				
    	    				}
    	    				
    	    			}
    	    			
    	    			inputHtml = inputHtml + "</ul>"
    	    			
    	    			$('#formInput').html(inputHtml);
    	    			
    				},
    				error : function(){
    					console.log("?????? ????????????.");
    					
    					alert("??????????????? ????????? ??????????????????. ?????? ????????? ?????????");
    				}
    			});
    			
    		
    		}else{
    			$('#formInput').html("");
    		}
    			
    		
    	});
    	
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
	<script type="text/x-handlebars-template"  id="deparEmpList-selector-template" >
		{{#each .}}
			<option value={{this.empl_no}} class=appendDepartEmp>{{this.ncnm}}</option>
		{{/each}}
	</script>
	<script type="text/x-handlebars-template" id="selected-dpartEmp-template">
		<span class="seleted-emp-span" onclick='removeSelected(this);'>{{empName}}<i class="fa-solid fa-xmark"></i><input type="hidden" name="setleEmpList" value="{{empNo}}/{{empName}}"></span>
		
	</script>
	
	<script type="text/javascript">
		$('#depart-selector').on('change',function(){
			var depart = $(this).val();
			$.getJSON("<%=request.getContextPath()%>/emp/EmpListByDepart?depart="+depart,function(empList){
				var template=Handlebars.compile($('#deparEmpList-selector-template').html());
				
				var empHtml = template(empList);
				
				$('.appendDepartEmp').remove();
				$('#depart-emp-seletor').append(empHtml);
			});
			
		});
		
		$('#add-setle-emp').on("click", function(){
			console.log("??????");
			
			var template = Handlebars.compile($('#selected-dpartEmp-template').html());
			var empvalue = {
					empNo : $('#depart-emp-seletor').val() , 
					empName : $('#depart-emp-seletor  option:checked').text() 
			};
			
			
			var empHtml = template(empvalue);
			
			for(var ta of $('input[name=setleEmpList]')){
				if($(ta).val() == empvalue.empNo+"/"+empvalue.empName){
					return;
				}
			}
			
			if($('#depart-emp-seletor').val() == "notSelect"){
				return;
			}
			
			$('#selected-depart-emp').append(empHtml);
		});
		
		function removeSelected(ta){
			
			
			$(ta).remove();
			
		}
	</script>
	

	
	<script>
		var savedArr = [];
		for(var att of $('input[name="savedAttach"]')){
			savedArr.push(Number($(att).val()));
		}
		var lastAno = Math.max(...savedArr);
		$("#submitForm").append("<input type='hidden' name='lastAno' value='"+lastAno+"'>");
	
		function inputToJsonByName(inputs){
			
			var inputJson = {};
			
			for(var tag of inputs){
				inputJson[tag.name] = tag.value;
			}
			
			
			return inputJson;
		}
	
		function backPage(){
			window.history.go(-1);
			
			
			
		}
		
		function checkInputNull(){
			
			var check = true;
			// ?????? ??????
			
			
			
			return check;
			
		}
	
		function regist_setle(){
			
			
			
			
			$("#submitForm").submit();

		}
	
	</script>
	
	
	<script type="text/x-handlebars-template" id="attachView-template">
		{{#each fileArr}}
		 <div class="file flex al-it-ce" role="fileListView" onclick="ViewRemove(this)">
         	<i class="fa-solid fa-file-lines"></i>
         	<span>{{this.name}}</span>
         	<i class="fa-solid fa-xmark"></i>
         </div>
		{{/each}}

	</script>
	
	
<!-- 	???????????????????????? -->
	
	<script type="text/javascript">
	
	
	function printFileView(obj){
		var fileList = Array.from(obj.files)
		var template = Handlebars.compile($('#attachView-template').html());
		
		var fileArr = [];
		for(var file of fileList){
			fileArr.push({"name" : file.name})
		}
		
		var updateHtml = template({"fileArr":fileArr});
		
		$('div[role="fileListView"]').not(':has(input)').remove();
		$('#file-attach-div').after(updateHtml);
		
		
		
		
	}
	
	
	var input = document.createElement("input");	

	function fileAdd(){
		input = document.createElement("input");
		
		input.type = "file";
		input.multiple = "multiple";
		input.click();
		console.log(input.files.length);
		

		input.addEventListener("change", inputChange);
		
		
		
		
	}
	
    function validation(obj){
        const fileTypes = ['text/plain','application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
        if (obj.name.length > 100) {
            alert("???????????? 100??? ????????? ????????? ?????????????????????.");
            return false;
        } else if (obj.size > (100 * 1024 * 1024)) {
            alert("?????? ?????? ????????? 100MB??? ????????? ????????? ?????????????????????.");
            return false;
        } else if (obj.name.lastIndexOf('.') == -1) {
            alert("???????????? ?????? ????????? ?????????????????????.");
            return false;
        } else if (!fileTypes.includes(obj.type)) {
            alert("????????? ???????????? ????????? ?????????????????????.");
            return false;
        } else {
            return true;
        }
    }
    
    var attachSize = ${fn:length(setle.setleAttachList)};
	
	function inputChange(){
		
		
		var data = new DataTransfer();
		var files = document.querySelector('#file').files;
		files = Array.from(files);
		
		for(var file of Array.from(input.files)){
		
			if(validation(file)){
			
				files.push(file);
			}
		
		}
		
		if(files.length+attachSize > 5){
			alert("??????????????? ?????? 5????????????.");
			return;
		} 
		for(var file of files){
			 data.items.add(file);
		}
		document.querySelector('#file').files = data.files;
		printFileView(document.querySelector('#file'));
	}
	
	
	
	
	
	var fileRemove = function(fileNum){ //fileNum??? li ??? index ??? 
		
		const dataTransfer = new DataTransfer(); 
		let files = $('#file')[0].files; 
		//???????????? ????????? ????????? ????????? ?????? 
		let fileArray = Array.from(files); 
		//????????? ????????? ????????? ????????? ??????(FileList -> Array) 
		fileArray.splice(fileNum, 1); 
		//???????????? index??? ????????? ???????????? ?????? 
		fileArray.forEach(file => { dataTransfer.items.add(file); }); 
		//?????? ????????? dataTransfer??? ??????(Array -> FileList) 
		$('#file')[0].files = dataTransfer.files; 
		//?????? ????????? FileList??? ????????? 
		

	
		
	}

	
	
	function ViewRemove(obj){
		
		
		
		
		if($(obj).children("input").length != 0){
			

			var html = "<input type='hidden' name='removeAttaches' value='"+$(obj).children("input").val()+"'>"
			obj.remove();
			$("#submitForm").append(html);
			
			attachSize = attachSize-1;
			
			console.log(attachSize);
			
			
		}else{
			var index = $('div[role="fileListView"]').not(':has(input)').index(obj);
			
			obj.remove();
			
			fileRemove(index);
			
		}
		
	}
	
	
	
	</script>
	
</body>
</html>