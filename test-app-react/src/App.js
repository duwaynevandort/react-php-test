import React, { Component } from 'react';
import Row from './Row';
import './App.css';
import axios from 'axios';

class App extends Component {
  constructor() {
    super();
    this.state = {
      rows: []
    }   
    this.addRow = this.addRow.bind(this);
    this.moveRow = this.moveRow.bind(this);
    this.deleteRow = this.deleteRow.bind(this);
    this.updateRow = this.updateRow.bind(this);
  }
  addRow() {
    axios.post(`http://localhost:8000/data/`, {text:''})
      .then(res => {
        let rows = this.state.rows;
        rows.push(res.data)
        this.setState({rows});
      }).catch((error) => console.log(error));
  }
  moveRow(direction, id) {
    axios.put(`http://localhost:8000/data/${direction}/${id}`)
      .then(res => {
        const rows = res.data;
        this.setState({rows});
      }).catch((error) => console.log(error));
  }
  deleteRow(id) {    
    axios.delete(`http://localhost:8000/data/${id}`)
      .then(res => {
        let rows = this.state.rows;
        rows = rows.filter((row) => {
          return row.id !== res.data;
        });        
        this.setState({rows});
      }).catch((error) => console.log(error));
  }
  updateRow(id, e) {
    const text = e.target.value;    
    axios.put(`http://localhost:8000/data/${id}`,{text: text})
      .then(res => {                
        const rows = this.state.rows;        
        for (let i in rows) {
          if (rows[i].id === res.data.id) {
            rows[i].text = res.data.text;
            break;
          }
        }
        this.setState({rows})
      }).catch((error) => console.log(error));
  }
  componentDidMount() {
    axios.get(`http://localhost:8000/data/`)
      .then(res => {
        this.setState({rows: res.data});
      }).catch((error) => console.log(error));
  }
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <h2>Add, Edit, Delete, Sort App</h2>
        </div>
        <div className="App-body">
          {this.state.rows.map( row => <Row key={row.id} row={row} moveRow={this.moveRow} deleteRow={this.deleteRow} updateRow={this.updateRow}/>)}        
          <div className="add-row" onClick={this.addRow}>
            Add Row
          </div>
        </div>
      </div>
    );
  }
}

export default App;
