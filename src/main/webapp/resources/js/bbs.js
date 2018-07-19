function check() {
   if ($.trim($('#bbs_name').val()) == "") {
      alert('이름을 입력하세요.');
      $('#bbs_name').focus();
      return false;
   }

   if ($.trim($('#bbs_pass').val()) == "") {
      alert("비밀번호를 입력하세요.")
      $('#bbs_pass').focus().val("");
      return false;
   }
   if ($.trim($('#bbs_subject').val()) == "") {
      alert("글제목을 입력하세요.")
      $('#bbs_subject').focus().val("");
      return false;
   }
   if ($.trim($('#bbs_content').val()) == "") {
      alert("글내용을 입력하세요.")
      $('#bbs_content').focus().val("");
      return false;
   }
};

function fileshow(){
   if($("#filevalue").text()==""){
      $("#close").css('display', 'none');
   } else {
      $("#close").css('display', 'inline');
   }
}

$(function(){
   fileshow();
   $("#upfile").change(function(){
      $('#filfevalue').text('');
      //$(this).val() => C:\fakepath\image1.png
      var inputfile=$(this).val().split('\\'); // C: ,fakepath, image1.png
      $('#filevalue').text(inputfile[inputfile.length-1]);
      fileshow();
   })
   
   
      $('#close').click(function(){
         $('#filevalue').text('');
         $(this).css('display', 'none');
         $('#upfile').val('');
      });
   });
