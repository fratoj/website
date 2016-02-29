import angular from 'angular';
import Navbar from './navbar/navbar';
import Header from './header/header';
import Hero from './hero/hero';
import Footer from './footer/footer';
import User from './user/user';

let commonModule = angular.module('app.common', [
	Navbar.name,
  Header.name,
  Footer.name,
  Hero.name,
	User.name
]);

export default commonModule;