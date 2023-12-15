import { Body, Controller, Get, Post, Render, Res } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { Kupon } from './Kupon';
import { Response } from 'express';
import { parse } from 'path';

const conn = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 3306,
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'database',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Render('index')
  async index() {
    const [data] = await conn.execute("SELECT title, percentage, code FROM kuponok ORDER BY title");
    return { data};
  }

  @Get('/ujKupon')
  @Render('ujKupon')
  kuponForm() {
    return{error:"",percentage:"", code:"",title:""};
  }

  @Post('/ujKupon')
  @Render('ujKupon')
  async postForm(@Body() kupon:Kupon, @Res() res:Response) {
    let error:string;
    if(kupon.title.trim().length < 1){
      error = 'Adjon meg egy címet!';
      return {error, title:"", percentage:kupon.percentage, code:kupon.code}
    }
    if(kupon.percentage < 1 || kupon.percentage > 99){
      error = 'A szuázaléknak 1 és 99-között kell lenni-e!'
      return {error, title:kupon.title, percentage:"", code:kupon.code}
    }
    if(!new RegExp(/^[A-Z]{4}-[0-9]{6}$/gm).test(kupon.code)){
      error = 'Rossz a kód formátuma(AAAA-000000)!';
      return {error, title: kupon.title, percentage: kupon.percentage, code:""}
    }
    else{
      console.log(kupon);
      const [result] = await conn.execute("INSERT INTO kuponok (title,percentage,code) VALUES (?,?,?)",[kupon.title, kupon.percentage, kupon.code]);
      console.log(result);
      res.redirect("/");
    }
  }
}
