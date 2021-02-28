<template>
<div class="container">
        <h1>List Orders</h1>
        <div class="orders">
            <ul>
                <li v-for="(route, index) in routes" :key="index">
                    <div class="order" :class="route.status === 'onroute' || route.status === 'pending' ? 'order-info':'order-success'">
                        <div class="head">
                            <div class="col1">Ruta</div>
                            <div class="col2">Conductor</div>
                            <div class="col3">Creada</div>
                            <div class="col4">Inició</div>
                            <div class="col5">Terminó</div>
                            <div class="col6">Entregas</div>
                            <div class="col7"></div>
                        </div>
                        <div class="body">
                            <div class="col1">{{ route.id }}</div>
                            <div class="col2">{{ route.driver_name }}</div>
                            <div class="col3">{{ route.created_at }}</div>
                            <div class="col4">{{ route.started }}</div>
                            <div class="col5">{{ route.ended }}</div>
                            <div class="col6">{{ route.deliveries }}</div>
                            <div class="col7">
                              <span v-if="route.status === 'onroute'" class="bud-info">En ruta</span>
                              <span v-else-if="route.status === 'pending'" class="bud-info">Pendiente</span>
                              <span v-else class="bud-success">Entregado</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
import listRoutes from '../assets/routes.json'
export default {
  name: 'HelloWorld',
  data() {
    return {
      routes: [],
      connection : null
    }
  },
  methods: {
    loadOrders() {
      this.routes = listRoutes.routes;
    }
  },
  created() {
      this.connection = new WebSocket("ws://localhost:8080");
      this.connection.onopen = (event) => {
          console.log(event)
          console.log('Successfully connected to localhost:8080')
      }
      this.connection.onmessage = (payload) => {
          const data = JSON.parse(payload.data);
          console.log(data.status, 'Status');
          let route = this.routes.find(r => r.id === data.route_id);
          const now = new Date();
          if (data.status === 'onroute' && !route.started) {
              const time = now.getHours() + ":" + now.getMinutes()
              route.started = time;
          }
          if (data.status === 'completed') {
              const time = now.getHours() + ":" + now.getMinutes()
              route.ended = time;
          }
          Object.assign(route, data);
      }
  },
  mounted() {
    this.loadOrders();
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1 {
    text-align: center;
}
.container {
    margin-left: auto;
    margin-right: auto;
    display: block;
    width: 900px;
}
.orders ul {
    width: 100%;
    list-style: none;
    padding-left: 0;
}
.orders ul li .order{
    padding: 15px;
    border-radius: 3px;
    background-color: #fff;
    margin-bottom: 5px;
}
.orders ul li .order-info {
    border-left: 5px solid #4f81c0;
}
.orders ul li .order-info span.bud-info {
    background-color: #4f81c0;
    color: #fff;
    padding: 6px 10px;
    border-radius: 15px;
    font-size: 13px;
}
.orders ul li .order-success {
    border-left: 5px solid #6aa726;
}
.orders ul li .order-success span.bud-success {
    background-color: #6aa726;
    color: #fff;
    padding: 6px 10px;
    border-radius: 15px;
    font-size: 13px;
}
.orders ul li .head {
    padding-bottom: 10px;
}
.orders ul li .head div{
    color: #b1b1b1;
    display: inline-block;
    font-size: 12px;
}
.orders ul li .head .col1 {
    width: 90px;
}
.orders ul li .head .col2 {
    width: 140px;
}
.orders ul li .head .col3 {
    width: 200px;
}
.orders ul li .head .col4 {
    width: 90px;
}
.orders ul li .head .col5 {
    width: 90px;
}
.orders ul li .head .col6 {
    width: 90px;
}
.orders ul li .head .col7 {
    width: 90px;
}
.orders ul li .body .col1 {
    width: 90px;
}
.orders ul li .body .col2 {
    width: 140px;
}
.orders ul li .body .col3 {
    width: 200px;
}
.orders ul li .body .col4 {
    width: 90px;
}
.orders ul li .body .col5 {
    width: 90px;
}
.orders ul li .body .col6 {
    width: 90px;
}
.orders ul li .body .col7 {
    text-align: right;
    width: 125px;
}
.orders ul li .body div {
    color: #323232;
    display: inline-block;
}
</style>
