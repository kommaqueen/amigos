// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CategoryFilterController from "./category_filter_controller"
application.register("category-filter", CategoryFilterController)

import CheckInController from "./check_in_controller"
application.register("check-in", CheckInController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import StarRatingController from "./star_rating_controller"
application.register("star-rating", StarRatingController)
