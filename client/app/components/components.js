import angular from 'angular';
import Home from './home/home';
import About from './about/about'; 
import Clients from './clients/clients'; 
import Careers from './careers/careers'; 
import Contact from './contact/contact'; 

let componentModule = angular.module('app.components', [
	Home.name,
	Clients.name,
  About.name,
  Careers.name,
  Contact.name
]);

export default componentModule;