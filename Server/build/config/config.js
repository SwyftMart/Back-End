"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.establishConnection = exports.SQL_SERVER_CONFIG = void 0;
///////////////////////////
//////// IMPORTS /////////
/////////////////////////
const mssql_1 = __importDefault(require("mssql"));
const path_1 = __importDefault(require("path"));
const dotenv_1 = __importDefault(require("dotenv"));
const console_1 = require("console");
// CONFIGURE DOTENV PATH
dotenv_1.default.config({ path: path_1.default.resolve(__dirname, '../../.env') });
///////////////////////////////
// SQL SERVER CONFIGURATION //
///////////////////////////////
exports.SQL_SERVER_CONFIG = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    server: process.env.DB_SERVER,
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    },
    options: {
        encrypt: false,
        trustServerCertificate: false
    }
};
/////////////////////////////////////
/////// CONNECT TO DATABASE ////////
///////////////////////////////////
const establishConnection = () => __awaiter(void 0, void 0, void 0, function* () {
    const pool = yield mssql_1.default.connect(exports.SQL_SERVER_CONFIG);
    if (pool) {
        (0, console_1.log)('Connected to database...');
    }
});
exports.establishConnection = establishConnection;
