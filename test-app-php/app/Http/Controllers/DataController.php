<?php

namespace App\Http\Controllers;
use App\Data;
use Illuminate\Http\Request;

class DataController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function getAllRows()
    {
    	return Data::orderBy('order')->get();
    }

    public function getRow($id)
    {
    	return Data::findOrFail($id);
    }
    
    public function moveRowUp($id)
    {
    	$current = Data::find($id);    	
    	if ($current->order > 1) {
    		$next = Data::orderBy('order','DESC')->where('order','<',$current->order)->first();
            if (!is_null($next)) {
    		  DataController::swapOrder($current, $next); 
            }	
    	}    	
    	return Data::orderBy('order')->get();
    }

    public function moveRowDown($id)
    {
    	$current = Data::find($id);
    	$next = Data::orderBy('order','ASC')->where('order','>',$current->order)->first();
    	if (!is_null($next)) {
    		DataController::swapOrder($current, $next);   	
    	}    	
    	return Data::orderBy('order')->get();
    }

    public function swapOrder($current, $next) {
        $current_order = $current->order;
        $next_order = $next->order;
        $next->order = $current_order;
        $current->order = $next_order;
        $next->save();
        $current->save(); 
    }

    public function removeRow($id)
    {    
    	Data::destroy($id);
        return $id;	
    }

    public function addRow()
    {   
    	$last_order = Data::max('order');        
    	$data = new Data;
    	$data->text = "";    	
        $data->order = $last_order +1;
    	$data->save();
        return $data;
    }

    public function updateRow($id, Request $request)
    {
        $data = Data::find($id);
        $data->text = $request->json()->get('text');
        $data->save();
        return $data;        
    }
}
