var input1=0;
function displayTeacher(){
    if (input1==0) {
        document.getElementById("form1").style.display="flex";
        document.getElementById("TeachersContainer").style.backgroundColor="rgba(0, 0, 0, 0.4)"
        input1++;
    } else {
        document.getElementById("form1").style.display="none";
        document.getElementById("TeachersContainer").style.backgroundColor="transparent"
        input1=0;
    }
    
}
var input=0;
function displayStudents(){
    if (input==0) {
        document.getElementById("form2").style.display="flex";
        document.getElementById("studentContainer").style.backgroundColor="rgba(0, 0, 0, 0.4)"
        input++;
    }else{
        document.getElementById("form2").style.display="none";
        document.getElementById("studentContainer").style.backgroundColor="transparent" 
        input=0;
    }
   
}
function clear1(){
    console.log("hii");
    document.getElementById("in1").value="";
    document.getElementById("in2").value="";
}
function clear2(){
    console.log("bye");
    document.getElementById("button1").value="";
    document.getElementById("button2").value="";
}