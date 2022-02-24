
places = document.querySelector('.search_results')


var clicked = ''

// marked added places to the trip
places.addEventListener('click',function(event){
  element = event.target
  if(element.nodeName === 'BUTTON'){
    console.log(element)
    place_element = element.parentElement.parentElement
    
    if(element.innerText === 'Add to Trip'){
      element.innerText = 'Remove from Trip'
      element.style.backgroundColor = "#262626"
      place_element.classList.toggle("added");
      place_element.querySelector('.marked').classList.toggle('hidden')
    }else{
      element.innerText = 'Add to Trip'
      element.style.backgroundColor = "black"
      place_element.classList.toggle("added");
      place_element.querySelector('.marked').classList.toggle('hidden')
    }
  }
  
})