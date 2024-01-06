import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultSport {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;            // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    date: string;               // 申请的日期

    @Column({ type: 'varchar', length: 255, nullable: false })
    time: string;               // 申请的时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    type: string;               // 场地类型

    @Column({ type: 'varchar', length: 255, nullable: false })
    court: string;              // 申请的场地

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;           // 申请的位置

    @Column({ type: 'varchar', length: 255, nullable: false })
    collaborative: string;      // 是否接收陌生人加入

    @Column({ type: 'varchar', length: 255, nullable: false })
    number: string;             // 该预约订单目前有多少人
}