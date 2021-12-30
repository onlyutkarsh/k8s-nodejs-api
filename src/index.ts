import * as dotenv from 'dotenv'
import cors from 'cors'
import helmet from 'helmet'
import express, { Request, Response } from 'express'
import { BaseItem } from './models/BaseItem'
import { timeStamp } from 'console'

dotenv.config()

if (!process.env.PORT) {
    process.exit(1)
}

const PORT: number = parseInt(process.env.PORT as string, 10)

const app = express()

app.use(helmet())
app.use(cors())
app.use(express.json())

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
})

app.post('/api/dummy', (req: Request, res: Response) => {
    try {
        var body: BaseItem = req.body
        if (!body.id) {
            res.status(400).send('Missing id')
            return
        }
        var response = {
            message: `Recieved ID ${body.id}`,
            timeStamp: new Date().toISOString(),
        }
        res.status(200).send(response)
    } catch (e: any) {
        res.status(500).send(e.message)
    }
})
