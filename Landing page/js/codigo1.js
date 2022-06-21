let x=0;
function slider(){
    let imagenes=["imagenes/baner1.jpg","imagenes/baner2.jpg","imagenes/baner3.jpg"];
    document.getElementsByClassName("slider")[0].src=imagenes[x];
    x++;
    if(x>=imagenes.length)x=0;
    setTimeout(slider,2000)
}
slider();