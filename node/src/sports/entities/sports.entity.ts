import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultSport {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;            // 账号

    @Column({ type: 'date', nullable: false })
    date: Date;              // 申请的日期

    @Column({ type: 'datetime', nullable: false })
    startTime: Date;          // 申请的开始时间

    @Column({ type: 'datetime', nullable: false })
    endTime: Date;            // 申请的结束时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    type: string;               // 场地类型

    @Column({ type: 'varchar', length: 255, nullable: false })
    court: string;              // 申请的场地

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;           // 申请的位置

    @Column({ type: 'varchar', length: 255, nullable: false })
    collaborative: string;      // 是否接收陌生人加入

    @Column({ type: 'int', nullable: false })
    number: number;             // 该预约订单目前有多少人

    @Column({ type: 'varchar', length: 255, nullable: false })
    ownership: string;          // 是否是该订单发起者
}