let b1 = document.querySelector("#plus");
let b2 = document.querySelector("#min");
let t1 = document.querySelector("#qty");
let y=0;
let p = document.querySelector("#lp");
b1.addEventListener("click" , ()=>
{
    y++;
   t1.innerHTML = y; 
})
b2.addEventListener("click" , ()=>
{
    if(y>0)
    {
    y--;
    }
        t1.innerHTML = y;
    
})

p.addEventListener("click" , ()=>
{
    let r = t1.innerHTML;
    alert(r);
})      


