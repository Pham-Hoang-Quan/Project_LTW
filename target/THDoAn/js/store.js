(function($) {
 const categoryOptions = document.querySelectorAll('input[type=checkbox][name="categoryCheck"]')
 categoryOptions.forEach(function (option) {
    option.addEventListener('change', function() {
        console.log('option', option.checked)
        this.setAttribute('checked', option.checked)
    })
 })

 window.onload = () => {
  preFillFilteringData()
 }

 function preFillFilteringData () {
    const params = new URLSearchParams(document.location.search)
    const selectedCategories = params.getAll('category').map(category => `category-${category}`)
    const minPrice = params.get('minPrice')
    const maxPrice = params.get('maxPrice')

    if (selectedCategories && selectedCategories.length > 0) {
        categoryOptions.forEach(function(option) {
          if (selectedCategories.includes(option.id)) {
            document.querySelector(`#${option.id}`).setAttribute('checked', true)
          }
        })
    }

    if (!isNaN(minPrice) || !isNaN(maxPrice)) {
      const priceSlider = document.getElementById('price-slider')
      const min = parseInt(minPrice) || 1
      const max = parseInt(maxPrice) || 100000000

      if (priceSlider) {
         priceSlider.noUiSlider.set([parseInt(minPrice) || 1, parseInt(maxPrice) || 100000000], true, false)
      }

    }
  }

 document.querySelector('.checkbox-filter').addEventListener('load', function() {
   const params = new URLSearchParams(document.location.search)
   const selectedCategories = params.getAll('category').map(category => `category-${category}`)
   const minPrice = params.get('minPrice')
   const maxPrice = params.get('maxPrice')

   if (selectedCategories && selectedCategories.length > 0) {
       categoryOptions.forEach(function(option) {
         if (selectedCategories.includes(option.id)) {
           this.setAttribute('checked', true)
         }
       })
   }

   if (!isNaN(minPrice) || !isNaN(maxPrice)) {
     const priceSlider = document.getElementById('price-slider')

     if (priceSlider) {
        priceSlider.noUiSlider.set([minPrice || 1, maxPrice || 100000000])
     }

   }
 })

 $('#filterProducts').on('click', function() {
    const chosenCategoryOptionsQuery = Array.from(document.querySelectorAll('input[type=checkbox][name="categoryCheck"][checked="true"]')).map(chosenOption => `&category=${chosenOption.id.replace('category-', '')}`)

    const priceSlider = document.getElementById('price-slider')

    if (priceSlider) {
     const [minPrice, maxPrice] = priceSlider.noUiSlider.get()

     const query = `?minPrice=${minPrice}&maxPrice=${maxPrice}${chosenCategoryOptionsQuery.join('')}`

     window.location.search = query
    }
 })

})(jQuery)