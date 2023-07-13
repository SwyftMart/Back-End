"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const orderController_1 = require("../controllers/orderController");
// INITIALIZE ROUTER
const orderRoutes = (0, express_1.Router)();
// ROUTES
orderRoutes.post('', orderController_1.addOrder); // ADD ORDER
exports.default = orderRoutes;
