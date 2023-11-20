const cars = [
  { make: 'Honda', image: '../a_car_shop_with_filtering/images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: '../a_car_shop_with_filtering/images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: '../a_car_shop_with_filtering/images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: '../a_car_shop_with_filtering/images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: '../a_car_shop_with_filtering/images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: '../a_car_shop_with_filtering/images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: '../a_car_shop_with_filtering/images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];

cars.forEach((carObj, index) => carObj['id'] = index);

document.addEventListener('DOMContentLoaded', event => {
  function App() {
    this.init();
    this.bindEvents();
  }

  App.prototype = {
    buildHTML() {
      this.generateFilterOptions(this.filterForm);
      this.generateCars();
    },

    generateFilterOptions() {
      let selects = this.filterForm.querySelectorAll('select');
      selects.forEach(select => {
        this.addOptions(select, select.id);
      });
    },

    addOptions(selectElement, selectType) {
      let optionValues = cars.reduce((acc, car) => {
        if (!acc.includes(car[selectType])) acc.push(car[selectType]);
        return acc;
      }, []);
    
      optionValues.forEach(value => {
        let option = this.templates.option({value});
        selectElement.insertAdjacentHTML('beforeend', option);
      });
    },

    generateCars() {
      let carsHTML = this.cars.map(c => this.templates.car(c));
      carsHTML.forEach(c => {
        this.carsContainer.insertAdjacentHTML('beforeend', c);
      });
    },

    registerTemplates() {
      this.templates = {};
      let scripts = document.querySelectorAll('script[type="text/x-handlebars"]');
      scripts.forEach(script => {
        this.templates[script.dataset.template] = Handlebars.compile(script.innerHTML);
        script.remove();
      });
    },

    getFilters() {
      let filters = Array.from(this.selectDropdowns).map(s => {
        return {
          name: s.name,
          value: s.value,
        };
      }).filter(f => f.value !== '*');
      
      return filters;
    },

    selectCars(filters) {
      let selectedCars = this.cars;
      filters.forEach(f => {
        selectedCars = selectedCars.filter(car => String(car[f.name]) === f.value);
      });

      return selectedCars;
    },

    handleFilter(event) {
      event.preventDefault();

      let selectedCarIds = this.selectCars(this.getFilters()).map(c => String(c.id));

      Array.from(this.carsContainer.children).forEach(carElement => {
        if (selectedCarIds.includes(carElement.dataset.id)) {
          carElement.classList.remove('hidden');
        } else {
          carElement.classList.add('hidden');
        }
      });
    },

    limitModels(event) {
      let make = document.getElementById('make').selectedOptions[0].value;
      let allowedModels = this.cars.filter(car => {
        if (make === '*') return true;
        return make === car.make;
      }).map(car => car.model);

      let modelOptions = this.filterForm.querySelectorAll('select#model option');

      Array.from(modelOptions).forEach(option => {
        if (allowedModels.includes(option.value) || option.value === '*') {
          option.classList.remove('hidden');
        } else {
          option.classList.add('hidden');
        }
      });

      $('#model').val('*');
    },

    init() {
      this.cars = cars;
      this.filterForm = document.querySelector('form');
      this.selectDropdowns = this.filterForm.querySelectorAll('select');
      this.carsContainer = document.querySelector('div[data-id="cars_container"]');
      this.registerTemplates();
      this.buildHTML();
    },

    bindEvents() {
      this.filterForm.addEventListener('submit', this.handleFilter.bind(this));
      this.filterForm.querySelector('select#make').addEventListener('change', this.limitModels.bind(this));
    },
  };

  new App();
});