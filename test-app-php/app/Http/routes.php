<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return $app->version();
});

$app->get('/data', 'DataController@getAllRows');

$app->get('/data/{id}', 'DataController@getRow');

$app->put('/data/up/{id}', 'DataController@moveRowUp');

$app->put('/data/down/{id}', 'DataController@moveRowDown');

$app->delete('/data/{id}', 'DataController@removeRow');

$app->post('/data', 'DataController@addRow');

$app->put('/data/{id}', 'DataController@updateRow');