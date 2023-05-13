import axios from 'axios'

axios.defaults.baseURL = "/api"

export const get_classroom = (data:any) => axios.get('/classroom', {params:data}).then(res => res.data)
