import React, { Component } from 'react';

class Row extends Component {
  constructor() {
    super();
    this.makeEditable = this.makeEditable.bind(this);
  }
  makeEditable(id) {    
    const outer_div = document.getElementById(id);
    outer_div.getElementsByClassName("editable")[0].style.display = "inline-block";
    outer_div.getElementsByClassName("non-editable")[0].style.display = "none";
  }
  makeNonEditable(id) {
    const outer_div = document.getElementById(id);
    outer_div.getElementsByClassName("editable")[0].style.display = "none";
    outer_div.getElementsByClassName("non-editable")[0].style.display = "block";
  }
  render() {
    const text = this.props.row.text;
    const id = this.props.row.id;
    return (
      <div className="row" id={id} onMouseEnter={() => this.makeEditable(id)} onMouseLeave={() => this.makeNonEditable(id)}>
        <div className="editable" style={{display: 'none'}}>    
          <div>
            <input type="text" onBlur={(e) => this.props.updateRow(id, e)} defaultValue={text} />
          </div> 
          <div onClick={() => this.props.moveRow('up',id)}>
            Up
          </div>
          <div onClick={() => this.props.moveRow('down',id)}>
            Down
          </div>
          <div onClick={() => this.props.deleteRow(id)}>      
            Delete
          </div>
        </div>
        <div className="non-editable">
          {text}
        </div>
      </div>
    );
  }
}

export default Row;
