import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultSeat {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;            // 账号
    
    @Column({ type: 'varchar', length: 255, nullable: false })
    floor: string;              // 楼层

    @Column({ type: 'date', nullable: false })
    date: Date;               // 申请的日期

    @Column({ type: 'varchar', length: 255, nullable: false })
    number: string;             // 申请的桌号

    @Column({ type: 'varchar', length: 255, nullable: false })
    time: string;               // 申请的时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    seat: string;               // 申请的位置
}